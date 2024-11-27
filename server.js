require('dotenv').config(); // Thêm dòng này để đọc biến môi trường từ .env

const path = require('path');
const bcrypt = require('bcrypt'); 
const express = require('express');
const session = require('express-session');
const passport = require('passport');
const bodyParser = require('body-parser');
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();
const app = express();
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));
app.use('/uploads', express.static('uploads'));

const multer = require('multer');
const crypto = require('crypto');
const nodemailer = require('nodemailer');
const flash = require('connect-flash');
const GoogleStrategy = require('passport-google-oauth20').Strategy;

// Cấu hình Multer
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads/');
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + '-' + file.originalname);
  }
});

const upload = multer({ storage: storage });
app.use(bodyParser.urlencoded({ extended: true }));
app.use('/images', express.static('images'));

// Sử dụng biến môi trường cho session secret
app.use(session({
  secret: process.env.SESSION_SECRET,
  resave: false,
  saveUninitialized: true
}));
app.use(passport.initialize());
app.use(passport.session());
app.use(flash());

app.use((req, res, next) => {
  res.locals.message = req.flash('message');
  next();
});

app.use(async (req, res, next) => {
  if (req.session.userId) {
    const user = await prisma.user.findUnique({
      where: { id: req.session.userId }
    });
    res.locals.user = user;
  } else {
    res.locals.user = null;
  }
  next();
});

// Cấu hình Nodemailer để gửi email (dùng biến môi trường)
const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: process.env.EMAIL_USER, // Đọc từ .env
    pass: process.env.EMAIL_PASS  // Đọc từ .env
  }
});

// Cấu hình Passport Google OAuth (dùng biến môi trường)
passport.use(new GoogleStrategy({
  clientID: process.env.GOOGLE_CLIENT_ID, // Đọc từ .env
  clientSecret: process.env.GOOGLE_CLIENT_SECRET, // Đọc từ .env
  callbackURL: '/auth/google/callback'
}, async (accessToken, refreshToken, profile, done) => {
  try {
    let user = await prisma.user.findUnique({
      where: { email: profile.emails[0].value }
    });

    if (!user) {
      user = await prisma.user.create({
        data: {
          email: profile.emails[0].value,
          password: null
        }
      });
    }
    done(null, user);
  } catch (error) {
    done(error, null);
  }
}));




app.get('/auth/google/callback', passport.authenticate('google', {
  failureRedirect: '/login'
}), (req, res) => {
  // Kiểm tra xem người dùng mới có cần đặt mật khẩu không
  if (req.user && !req.user.password) {
    req.session.userId = req.user.id; // Lưu userId vào session
    return res.redirect('/set-password'); // Chuyển đến trang đặt mật khẩu
  }
  // Chuyển hướng đến trang chính nếu không
  res.redirect('/');
});



// Khởi tạo Passport
passport.serializeUser((user, done) => {
  done(null, user.id); // Lưu ID người dùng vào session
});

passport.deserializeUser(async (id, done) => {
  const user = await prisma.user.findUnique({
    where: { id: id }
  });
  done(null, user); // Phục hồi thông tin người dùng từ session
});


// Trang đăng nhập
app.get('/login', (req, res) => {
  res.render('login');
});


// Xử lý đăng nhập
app.post('/login', async (req, res) => {
  const { email, password } = req.body;
  const user = await prisma.user.findUnique({
    where: { email: email }
  });

  if (!user) {
    return res.status(401).send("Email hoặc mật khẩu không đúng");
  }

  const passwordMatch = await bcrypt.compare(password, user.password);
  if (!passwordMatch) {
    return res.status(401).send("Email hoặc mật khẩu không đúng");
  }

  // Gán userId vào session
  req.session.userId = user.id;
  console.log("User ID after login:", req.session.userId); // Log để kiểm tra
  res.redirect('/');
});


app.get('/logout', (req, res) => {
  req.session.destroy((err) => {
    if (err) {
      return res.status(500).send('Có lỗi xảy ra khi đăng xuất');
    }

    res.redirect('/login');
  });
});

function requireLogin(req, res, next) {
  if (!req.session.userId && !req.isAuthenticated()) {
    return res.redirect('/login');
  }
  next();
}

app.get('/products', requireLogin, async (req, res) => {
  const { page = 1, limit = 10, category, search, minPrice, maxPrice } = req.query;
  const offset = (page - 1) * limit;

  try {
    // Log incoming query parameters
    console.log("Incoming Query Parameters:", { page, limit, category, search, minPrice, maxPrice });

    // Fetch categories for the sidebar
    const categories = await prisma.category.findMany();

    // Fetch category object if `category` query parameter is provided
    let categoryObj = null;
    if (category) {
      categoryObj = await prisma.category.findFirst({
        where: { name: category },
      });
    }

    // Build filtering conditions
    const whereConditions = {};

    if (categoryObj) {
      whereConditions.categoryId = categoryObj.id;
    }

    if (search) {
      whereConditions.name = {
        contains: search.toLowerCase(), // Chuyển `search` thành chữ thường để tìm kiếm không phân biệt chữ hoa chữ thường
      };
    }

    if (minPrice || maxPrice) {
      whereConditions.price = {
        ...(minPrice ? { gte: parseFloat(minPrice) } : {}),
        ...(maxPrice ? { lte: parseFloat(maxPrice) } : {}),
      };
    }

    // Log filtering conditions
    console.log("Filtering Conditions:", whereConditions);

    // Fetch filtered products
    const products = await prisma.product.findMany({
      where: whereConditions,
      skip: offset,
      take: parseInt(limit),
    });

    // Log fetched products for debugging
    console.log("Fetched Products:", products);

    // Count total matching products
    const totalProducts = await prisma.product.count({
      where: whereConditions,
    });

    // Calculate total pages
    const totalPages = Math.ceil(totalProducts / limit);

    // Log final render data
    console.log("Render Data:", {
      totalProducts,
      totalPages,
      currentPage: parseInt(page),
      currentCategory: category || '',
      currentSearch: search || '', // Pass `search` to template as `currentSearch`
      minPrice: minPrice || '',
      maxPrice: maxPrice || '',
    });

    // Render the index template
    res.render('index', {
      products,
      totalPages,
      currentPage: parseInt(page),
      currentCategory: category || '',
      categories,
      currentSearch: search || '', 
      minPrice: minPrice || 0, 
      maxPrice: maxPrice || 50000000, 
    });
  } catch (error) {
    console.error("Error fetching products:", error);
    res.status(500).send("Có lỗi xảy ra khi lấy sản phẩm");
  }
});


app.get('/', requireLogin, async (req, res) => {
  const { page = 1, limit = 10, category } = req.query;
  const offset = (page - 1) * limit;

  // Lấy danh sách sản phẩm, có lọc theo danh mục nếu category được cung cấp
  const productQuery = category
    ? { where: { category: category } }
    : {};

  const products = await prisma.product.findMany({
    ...productQuery,
    skip: parseInt(offset),
    take: parseInt(limit),
  });

  // Đếm tổng số sản phẩm trong category
  const totalProducts = await prisma.product.count(productQuery);
  const totalPages = Math.ceil(totalProducts / limit);

  // Lấy danh sách các danh mục
  const categories = await prisma.category.findMany();

  // Truyền products, categories và các biến khác vào template
  res.render('index', {
    products,
    totalPages,
    currentPage: parseInt(page),
    categories, // Truyền categories vào template
    currentCategory: category,
    currentSearch: '',
    minPrice: 0, 
    maxPrice: 50000000, 
  });
});


app.get('/register', (req, res) => {
  res.render('register');
});

app.post('/register', async (req, res) => {
  const { email, password } = req.body;

  const existingUser = await prisma.user.findUnique({
    where: { email: email }
  });

  if (existingUser) {
    return res.status(400).send("Email đã tồn tại");
  }

  const hashedPassword = await bcrypt.hash(password, 10);

  await prisma.user.create({
    data: {
      email: email,
      password: hashedPassword,
    }
  });

  req.flash('message', 'Tài khoản đã đăng ký thành công');

  res.redirect('/login');
});

// Trang yêu cầu nhập email để khôi phục mật khẩu
app.get('/forgot-password', (req, res) => {
  res.render('forgot-password');
});

// Xử lý yêu cầu quên mật khẩu
app.post('/forgot-password', async (req, res) => {
  const { email } = req.body;

  const user = await prisma.user.findUnique({
    where: { email: email }
  });

  if (!user) {
    return res.status(400).send("Email không tồn tại trong hệ thống");
  }

  // Tạo mã xác nhận ngẫu nhiên 6 chữ số
  const resetCode = Math.floor(100000 + Math.random() * 900000).toString();

  // Lưu mã xác nhận vào session hoặc database (ở đây sử dụng session)
  req.session.resetCode = resetCode;
  req.session.resetEmail = email;

  // Gửi email chứa mã xác nhận
  const mailOptions = {
    from: 'duytvhe172200@fpt.edu.vn',
    to: email,
    subject: 'Mã xác nhận khôi phục mật khẩu',
    text: `Mã xác nhận của bạn là: ${resetCode}`
  };

  transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      console.error('Error sending email: ', error);
      return res.status(500).send('Không thể gửi email');
    }
    res.redirect('/verify-reset-code');
  });
});


// Trang nhập mã xác nhận
app.get('/verify-reset-code', (req, res) => {
  res.render('verify-reset-code');
});

// Xử lý xác nhận mã
app.post('/verify-reset-code', (req, res) => {
  const { code } = req.body;

  // Kiểm tra mã xác nhận
  if (code === req.session.resetCode) {
    res.redirect('/reset-password');
  } else {
    return res.status(400).send('Mã xác nhận không đúng');
  }
});

// Trang nhập mật khẩu mới
app.get('/reset-password', (req, res) => {
  res.render('reset-password');
});

// Xử lý cập nhật mật khẩu
app.post('/reset-password', async (req, res) => {
  const { password, 'confirm-password': confirmPassword } = req.body;

  // Kiểm tra nếu mật khẩu và xác nhận mật khẩu không trùng khớp
  if (password !== confirmPassword) {
    return res.status(400).send('Mật khẩu và xác nhận mật khẩu không khớp');
  }

  // Mã hóa mật khẩu mới
  const hashedPassword = await bcrypt.hash(password, 10);

  // Cập nhật mật khẩu
  await prisma.user.update({
    where: { email: req.session.resetEmail },
    data: { password: hashedPassword }
  });

  // Xóa thông tin reset từ session
  req.session.resetCode = null;
  req.session.resetEmail = null;

  // Lưu thông báo thành công vào flash message
  req.flash('success-message', 'Mật khẩu đã được cập nhật thành công');

  // Chuyển hướng về trang đăng nhập
  res.redirect('/login');
});


app.post('/upload-file/:id', upload.single('file'), async (req, res) => {
  const productId = parseInt(req.params.id);

  if (!req.file) {
    return res.status(400).send('Không có file nào được tải lên');
  }

  await prisma.file.create({
    data: {
      filename: req.file.filename,
      originalname: req.file.originalname,
      productId: productId
    }
  });
  res.redirect('/products');
});

// GET route để render trang thêm sản phẩm
app.get('/add-product', requireLogin, async (req, res) => {
  try {
    // Lấy danh sách các danh mục từ database
    const categories = await prisma.category.findMany();

    // Render trang add-product.ejs và truyền danh mục vào
    res.render('add-product', { categories });
  } catch (error) {
    console.error("Error fetching categories: ", error);
    res.status(500).send("Có lỗi xảy ra khi lấy danh mục sản phẩm.");
  }
});



app.post('/add-product', requireLogin, async (req, res) => {
  console.log(req.body);
  const { name, link, imageUrl, price, quantity, category } = req.body; // Nhận thêm category từ form
  const userId = req.session.userId;

  if (!userId) {
    console.error("User ID is missing");
    return res.status(400).send("Không tìm thấy thông tin người dùng.");
  }

  try {
    // Chuyển đổi `price` và `quantity` để đảm bảo chúng là kiểu số
    const parsedPrice = price ? parseFloat(price) : null;
    const parsedQuantity = quantity ? parseInt(quantity, 10) : null;

    // Thêm sản phẩm vào database với danh mục được chọn
    await prisma.product.create({
      data: {
        name: name,
        link: link,
        imageUrl: imageUrl || null,
        price: parsedPrice,  // Đảm bảo đúng kiểu dữ liệu float
        quantity: parsedQuantity,  // Đảm bảo đúng kiểu dữ liệu integer
        userId: userId,
        categoryId: parseInt(category) // Gán danh mục vào sản phẩm
      }
    });
    res.redirect('/products');
  } catch (error) {
    console.error("Error adding product: ", error);
    res.status(500).send(`Có lỗi xảy ra khi thêm sản phẩm: ${error.message}`);
  }
});


app.get('/edit-product/:id', requireLogin, async (req, res) => {
  const productId = parseInt(req.params.id);
  try {
    const product = await prisma.product.findUnique({
      where: { id: productId }
    });

    if (!product) {
      return res.status(404).send("Sản phẩm không tồn tại");
    }
    res.render('edit-product', { product });
  } catch (error) {
    console.error("Error fetching product: ", error);
    res.status(500).send("Có lỗi xảy ra");
  }
});


app.post('/edit-product/:id', requireLogin, async (req, res) => {
  const productId = parseInt(req.params.id);
  const { name, link, imageUrl, price, quantity } = req.body;

  try {
    await prisma.product.update({
      where: { id: productId },
      data: {
        name: name,
        link: link,
        imageUrl: imageUrl || null, // Đảm bảo trường imageUrl được gán đúng
        price: price ? parseFloat(price) : null, // Chuyển đổi giá tiền sang float
        quantity: quantity ? parseInt(quantity, 10) : null // Chuyển đổi số lượng sang integer
      }
    });
    res.redirect('/products');
  } catch (error) {
    console.error("Error updating product: ", error);
    res.status(500).send("Có lỗi xảy ra khi cập nhật sản phẩm");
  }
});



app.get('/auth/google', passport.authenticate('google', {
  scope: ['profile', 'email']
}));

app.get('/auth/google/callback', passport.authenticate('google', {
  successRedirect: '/',
  failureRedirect: '/login'
}));

app.post('/delete-product/:id', requireLogin, async (req, res) => {
  const productId = parseInt(req.params.id);
  try {
    // Xóa tất cả các bản ghi CartItem liên quan trước
    await prisma.cartItem.deleteMany({
      where: {
        productId: productId
      }
    });

    // Xóa các file liên quan (nếu có)
    await prisma.file.deleteMany({
      where: {
        productId: productId
      }
    });

    // Xóa sản phẩm
    await prisma.product.delete({
      where: { id: productId }
    });

    res.redirect('/products');
  } catch (error) {
    console.error("Error deleting product: ", error);
    res.status(500).send("Có lỗi xảy ra khi xóa sản phẩm");
  }
});


app.get('/set-password', (req, res) => {
  if (!req.session.userId) {
    return res.redirect('/login'); // Nếu không có userId, chuyển hướng về trang login
  }
  res.render('set-password');
});

app.post('/set-password', async (req, res) => {
  const { password, confirmPassword } = req.body;
  const userId = req.session.userId; // Lấy userId từ session

  // Kiểm tra xem userId có tồn tại không
  if (!userId) {
    return res.status(400).send('Không tìm thấy thông tin người dùng.');
  }

  // Kiểm tra xem mật khẩu và xác nhận mật khẩu có khớp không
  if (password !== confirmPassword) {
    return res.status(400).send('Mật khẩu và xác nhận mật khẩu không khớp');
  }

  // Mã hóa mật khẩu mới
  const hashedPassword = await bcrypt.hash(password, 10);

  // Cập nhật mật khẩu
  await prisma.user.update({
    where: { id: userId }, // Cung cấp id để xác định người dùng
    data: { password: hashedPassword }
  });

  res.redirect('/'); // Chuyển hướng về trang chính
});

// Xem giỏ hàng
app.get('/cart', requireLogin, async (req, res) => {
  try {
    const cart = await prisma.cart.findUnique({
      where: { userId: req.session.userId },
      include: {
        products: {
          include: { product: true } // Đảm bảo bao gồm tất cả các trường cần thiết như 'price'
        }
      }
    });

    res.render('cart', { cart });
  } catch (error) {
    console.error("Error fetching cart: ", error);
    res.status(500).send("Có lỗi xảy ra khi lấy thông tin giỏ hàng");
  }
});


app.post('/cart/add', async (req, res) => {
  // Lấy dữ liệu từ form
  const { productId, cartId, quantity } = req.body;

  // Chuyển quantity thành số
  const quantityParsed = parseInt(quantity);

  // Kiểm tra xem quantity có hợp lệ không
  if (isNaN(quantityParsed) || quantityParsed <= 0) {
    console.log('Số lượng không hợp lệ:', quantityParsed);
    return res.status(400).send('Số lượng không hợp lệ');
  }

  // Kiểm tra xem sản phẩm đã có trong giỏ chưa
  const existingCartItem = await prisma.cartItem.findFirst({
    where: {
      productId: productId,
      cartId: cartId
    }
  });

  if (existingCartItem) {
    // Nếu sản phẩm đã có trong giỏ hàng, cập nhật số lượng
    await prisma.cartItem.update({
      where: {
        id: existingCartItem.id
      },
      data: {
        quantity: {
          increment: quantityParsed  // Thêm quantity vào sản phẩm đã có
        }
      }
    });
    console.log('Sản phẩm đã được cập nhật số lượng.');
  } else {
    // Nếu sản phẩm chưa có trong giỏ, tạo mới
    await prisma.cartItem.create({
      data: {
        productId: productId,
        cartId: cartId,
        quantity: quantityParsed,  // Gán số lượng cho sản phẩm mới
        product: {
          connect: { id: productId }  // Liên kết với sản phẩm
        }
      }
    });
    console.log('Sản phẩm mới đã được thêm vào giỏ.');
  }

  res.redirect('/cart');  // Chuyển hướng về trang giỏ hàng
});

app.post('/cart/remove/:itemId', requireLogin, async (req, res) => {
  const itemId = parseInt(req.params.itemId);
  try {
    const cartItem = await prisma.cartItem.findUnique({
      where: { id: itemId }
    });

    if (!cartItem) {
      return res.status(404).send("Không tìm thấy sản phẩm trong giỏ hàng");
    }

    // Tăng lại số lượng sản phẩm
    await prisma.product.update({
      where: { id: cartItem.productId },
      data: { quantity: { increment: cartItem.quantity } } // Trả lại toàn bộ số lượng nếu sản phẩm có số lượng lớn hơn 1
    });

    // Xóa sản phẩm khỏi giỏ hàng
    await prisma.cartItem.delete({
      where: { id: itemId }
    });

    res.redirect('/cart');
  } catch (error) {
    console.error("Error removing item from cart: ", error);
    res.status(500).send("Có lỗi xảy ra khi xóa sản phẩm khỏi giỏ hàng");
  }
});


// Route để hiển thị thông tin cá nhân
app.get('/profile', requireLogin, async (req, res) => {
  try {
    const user = await prisma.user.findUnique({
      where: { id: req.session.userId },
      select: {
        name: true,
        age: true,
        address: true,
        gender: true,
        email: true
      }
    });

    if (!user) {
      return res.status(404).send("Không tìm thấy thông tin người dùng");
    }

    res.render('profile', { user });
  } catch (error) {
    console.error("Error fetching user information: ", error);
    res.status(500).send("Có lỗi xảy ra khi lấy thông tin cá nhân");
  }
});

app.post('/update-profile', requireLogin, async (req, res) => {
  const { name, age, address, gender } = req.body;

  try {
    await prisma.user.update({
      where: { id: req.session.userId },
      data: {
        name: name,
        age: age ? parseInt(age, 10) : null,
        address: address,
        gender: gender
      }
    });
    res.redirect('/products'); // Chuyển hướng về danh sách sản phẩm sau khi cập nhật
  } catch (error) {
    console.error("Error updating profile: ", error);
    res.status(500).send("Có lỗi xảy ra khi cập nhật thông tin cá nhân");
  }
});


// Route để hiển thị danh sách đơn hàng
app.get('/orders', requireLogin, async (req, res) => {
  try {
    const orders = await prisma.order.findMany({
      where: { userId: req.session.userId },
      include: {
        orderDetails: {
          include: {
            product: true
          }
        }
      }
    });

    // Đảm bảo orders có dữ liệu
    if (!orders) {
      return res.status(404).send("Không có đơn hàng");
    }

    // Render view orders.ejs với dữ liệu orders
    res.render('orders', { orders: orders }); // Đảm bảo bạn truyền đúng dữ liệu ở đây
  } catch (error) {
    console.error("Error fetching orders: ", error);
    res.status(500).send("Có lỗi xảy ra khi lấy danh sách đơn hàng.");
  }
});



app.get('/change-password', requireLogin, (req, res) => {
  res.render('change-password');
});

app.post('/change-password', requireLogin, async (req, res) => {
  const { password, 'confirm-password': confirmPassword } = req.body;

  if (password !== confirmPassword) {
    return res.status(400).send('Mật khẩu và xác nhận mật khẩu không khớp');
  }

  try {
    // Mã hóa mật khẩu mới
    const hashedPassword = await bcrypt.hash(password, 10);

    // Cập nhật mật khẩu người dùng
    await prisma.user.update({
      where: { id: req.session.userId },
      data: { password: hashedPassword }
    });

    res.redirect('/products'); // Chuyển hướng về trang sản phẩm sau khi thay đổi mật khẩu
  } catch (error) {
    console.error("Error updating password: ", error);
    res.status(500).send("Có lỗi xảy ra khi cập nhật mật khẩu");
  }
});

app.post('/checkout', requireLogin, async (req, res) => {
  try {
    const userId = req.session.userId;

    const cart = await prisma.cart.findUnique({
      where: { userId: userId },
      include: {
        products: {
          include: { product: true }
        }
      }
    });

    if (!cart || cart.products.length === 0) {
      return res.status(400).send("Giỏ hàng của bạn trống.");
    }

    let totalAmount = 0;
    const productUpdates = []; // Mảng để lưu các bản cập nhật số lượng sản phẩm

    cart.products.forEach(item => {
      totalAmount += (item.product.price || 0) * item.quantity;

      // Thêm đối tượng cập nhật số lượng sản phẩm
      productUpdates.push({
        productId: item.productId,
        quantity: item.quantity
      });
    });

    // Tạo đơn hàng
    await prisma.order.create({
      data: {
        userId: userId,
        total: totalAmount,
        orderDetails: {
          create: cart.products.map(item => ({
            productId: item.productId,
            quantity: item.quantity
          }))
        }
      }
    });

    // Cập nhật số lượng sản phẩm
    for (const update of productUpdates) {
      await prisma.product.update({
        where: { id: update.productId },
        data: {
          quantity: {
            decrement: update.quantity // Giảm số lượng sản phẩm
          }
        }
      });
    }

    // Xóa tất cả các sản phẩm trong giỏ hàng
    await prisma.cartItem.deleteMany({
      where: { cartId: cart.id }
    });

    res.redirect('/orders'); // Chuyển hướng tới trang danh sách đơn hàng
  } catch (error) {
    console.error("Error processing checkout: ", error);
    res.status(500).send("Có lỗi xảy ra khi xử lý đặt hàng.");
  }
});

app.post('/orders/delete/:id', requireLogin, async (req, res) => {
  const orderId = parseInt(req.params.id);
  try {
    // Lấy tất cả các chi tiết đơn hàng (sản phẩm và số lượng) trước khi xóa
    const orderDetails = await prisma.orderDetail.findMany({
      where: { orderId: orderId },
      include: { product: true }
    });

    // Tăng lại số lượng sản phẩm trong kho dựa trên chi tiết đơn hàng
    for (const detail of orderDetails) {
      await prisma.product.update({
        where: { id: detail.productId },
        data: {
          quantity: { increment: detail.quantity }
        }
      });
    }

    // Xóa tất cả các chi tiết đơn hàng liên quan
    await prisma.orderDetail.deleteMany({
      where: { orderId: orderId }
    });

    // Xóa đơn hàng
    await prisma.order.delete({
      where: { id: orderId }
    });

    res.redirect('/orders');
  } catch (error) {
    console.error("Error deleting order: ", error);
    res.status(500).send("Có lỗi xảy ra khi xóa đơn hàng");
  }
});

app.get('/product/:id', async (req, res) => {
  const productId = parseInt(req.params.id);
  try {
    const product = await prisma.product.findUnique({
      where: { id: productId },
      include: { details: true } // Đảm bảo bạn bao gồm bảng ProductDetails
    });

    if (!product) {
      return res.status(404).send("Không tìm thấy sản phẩm");
    }

    res.render('product-detail', { product }); // Render view với thông tin sản phẩm
  } catch (error) {
    console.error("Error fetching product details:", error);
    res.status(500).send("Có lỗi xảy ra khi lấy thông tin sản phẩm");
  }
});

// Route để cập nhật thông tin sản phẩm
app.post('/product/update/:id', async (req, res) => {
  const productId = parseInt(req.params.id);
  const { screen, resolution, refreshRate, displayTechnology, brightness, camera, features, os, memoryStorage, designWeight, battery, connectivity, utilities } = req.body;

  try {
    // Sử dụng upsert để cập nhật nếu đã có hoặc tạo mới nếu chưa tồn tại
    await prisma.productDetails.upsert({
      where: { productId: productId },
      update: {
        screen,
        resolution,
        refreshRate,
        displayTechnology,
        brightness,
        camera,
        features,
        os,
        memoryStorage,
        designWeight,
        battery,
        connectivity,
        utilities,
      },
      create: {
        productId: productId,
        screen,
        resolution,
        refreshRate,
        displayTechnology,
        brightness,
        camera,
        features,
        os,
        memoryStorage,
        designWeight,
        battery,
        connectivity,
        utilities,
      }
    });

    res.redirect(`/product/${productId}`);
  } catch (error) {
    console.error("Error updating product details:", error);
    res.status(500).send("Có lỗi xảy ra khi cập nhật thông tin sản phẩm");
  }
});

app.get('/checkout/qr', requireLogin, async (req, res) => {
  const { orderId } = req.query;  // Lấy orderId từ query parameters

  try {
    // Tìm đơn hàng dựa trên orderId
    const order = await prisma.order.findUnique({
      where: { id: parseInt(orderId) },
      include: {
        orderDetails: {
          include: {
            product: true, // Bao gồm thông tin sản phẩm trong đơn hàng
          },
        },
      },
    });

    // Kiểm tra nếu không có đơn hàng
    if (!order) {
      return res.status(404).send("Không tìm thấy đơn hàng");
    }

    // Render QR code payment page và truyền thông tin đơn hàng vào view
    res.render('qr_payment', { order });
  } catch (error) {
    console.error("Error fetching order:", error);
    res.status(500).send("Có lỗi xảy ra khi lấy thông tin đơn hàng");
  }
});

app.post('/cart/add/:id', requireLogin, async (req, res) => {
  const productId = parseInt(req.params.id);
  const userId = req.session.userId;

  try {
    // Kiểm tra giỏ hàng của người dùng hoặc tạo mới nếu chưa có
    let cart = await prisma.cart.findUnique({
      where: { userId: userId }
    });

    if (!cart) {
      cart = await prisma.cart.create({
        data: { userId: userId }
      });
    }

    // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
    const existingCartItem = await prisma.cartItem.findFirst({
      where: {
        productId: productId,
        cartId: cart.id
      }
    });

    if (existingCartItem) {
      // Cập nhật số lượng nếu sản phẩm đã có trong giỏ hàng
      await prisma.cartItem.update({
        where: { id: existingCartItem.id },
        data: {
          quantity: existingCartItem.quantity + 1
        }
      });
    } else {
      // Thêm sản phẩm vào giỏ hàng
      await prisma.cartItem.create({
        data: {
          productId: productId,
          cartId: cart.id,
          quantity: 1
        }
      });
    }

    res.redirect('/cart'); // Chuyển hướng người dùng đến trang giỏ hàng
  } catch (error) {
    console.error("Error adding product to cart:", error);
    res.status(500).send("Có lỗi xảy ra khi thêm sản phẩm vào giỏ hàng.");
  }
});

const ExcelJS = require('exceljs');

app.get('/export-orders', requireLogin, async (req, res) => {
  try {
    const orders = await prisma.order.findMany({
      where: { userId: req.session.userId },
      include: {
        orderDetails: {
          include: {
            product: true
          }
        }
      }
    });

    if (!orders || orders.length === 0) {
      return res.status(404).send("Không có đơn hàng để xuất.");
    }

    // Create a new workbook and worksheet
    const workbook = new ExcelJS.Workbook();
    const worksheet = workbook.addWorksheet('Orders');

    // Add headers to the worksheet
    worksheet.columns = [
      { header: 'Mã Đơn Hàng', key: 'orderId', width: 15 },
      { header: 'Ngày', key: 'date', width: 20 },
      { header: 'Sản Phẩm', key: 'product', width: 25 },
      { header: 'Số Lượng', key: 'quantity', width: 10 },
      { header: 'Giá', key: 'price', width: 15 },
      { header: 'Tổng Tiền', key: 'total', width: 20 }
    ];

    // Add rows for each order and its details
    orders.forEach(order => {
      order.orderDetails.forEach(detail => {
        worksheet.addRow({
          orderId: order.id,
          date: order.date.toLocaleDateString(),
          product: detail.product.name,
          quantity: detail.quantity,
          price: detail.product.price.toLocaleString(),
          total: order.total.toLocaleString()
        });
      });
    });

    // Set response headers for Excel file download
    res.setHeader('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    res.setHeader('Content-Disposition', 'attachment; filename="orders.xlsx"');

    // Write workbook to the response
    await workbook.xlsx.write(res);
    res.end();
  } catch (error) {
    console.error("Error exporting orders:", error);
    res.status(500).send("Có lỗi xảy ra khi xuất đơn hàng");
  }
});


app.get('/charts', requireLogin, async (req, res) => {
  res.render('charts'); // Hiển thị file EJS chứa giao diện chọn biểu đồ
});

app.get('/charts/data', requireLogin, async (req, res) => {
  const { type, timeRange, startDate, endDate } = req.query;
  let data = { labels: [], values: [], label: '' };

  try {
      // Xử lý logic bộ lọc thời gian
      const filter = {};
      if (timeRange === 'today') {
          const start = new Date();
          start.setHours(0, 0, 0, 0);
          const end = new Date();
          end.setHours(23, 59, 59, 999);
          filter.date = { gte: start, lt: end };
      } else if (timeRange === 'yesterday') {
          const start = new Date();
          start.setDate(start.getDate() - 1);
          start.setHours(0, 0, 0, 0);
          const end = new Date();
          end.setDate(end.getDate() - 1);
          end.setHours(23, 59, 59, 999);
          filter.date = { gte: start, lt: end };
      } else if (timeRange === 'thisWeek') {
          const now = new Date();
          const start = new Date(now.setDate(now.getDate() - now.getDay()));
          start.setHours(0, 0, 0, 0);
          filter.date = { gte: start };
      } else if (timeRange === 'lastWeek') {
          const now = new Date();
          const start = new Date(now.setDate(now.getDate() - now.getDay() - 7));
          const end = new Date(now.setDate(now.getDate() - now.getDay() - 1));
          start.setHours(0, 0, 0, 0);
          end.setHours(23, 59, 59, 999);
          filter.date = { gte: start, lt: end };
      } else if (timeRange === 'custom' && startDate && endDate) {
          filter.date = {
              gte: new Date(startDate),
              lte: new Date(endDate),
          };
      }

      if (type === 'salesByDay') {
          // Tổng sản phẩm bán ra theo ngày
          const sales = await prisma.order.findMany({
              where: filter,
              orderBy: { date: 'asc' },
              select: {
                  date: true,
                  total: true,
              },
          });

          const groupedSales = sales.reduce((acc, sale) => {
              const date = new Date(sale.date).toLocaleDateString();
              acc[date] = (acc[date] || 0) + (sale.total || 0);
              return acc;
          }, {});

          data.labels = Object.keys(groupedSales);
          data.values = Object.values(groupedSales);
          data.label = 'Sản phẩm bán ra theo ngày';

      } else if (type === 'revenueByMonth') {
          // Doanh số theo tháng
          const sales = await prisma.order.findMany({
              where: filter,
              select: {
                  date: true,
                  total: true,
              },
          });

          const monthlySales = sales.reduce((acc, sale) => {
              const month = new Date(sale.date).toLocaleString('default', { month: 'long', year: 'numeric' });
              acc[month] = (acc[month] || 0) + (sale.total || 0);
              return acc;
          }, {});

          data.labels = Object.keys(monthlySales);
          data.values = Object.values(monthlySales);
          data.label = 'Doanh số sản phẩm theo tháng';

      } else if (type === 'topProductsByMonth') {
          // Sản phẩm bán nhiều nhất theo tháng
          const start = filter.date?.gte || new Date('1970-01-01');
          const end = filter.date?.lt || new Date();

          // Truy vấn OrderDetail và liên kết với Order để lọc theo thời gian
          const topProducts = await prisma.orderDetail.findMany({
              where: {
                  order: {
                      date: {
                          gte: start,
                          lt: end,
                      },
                  },
              },
              select: {
                  productId: true,
                  quantity: true,
              },
          });

          // Gom nhóm và tính tổng số lượng theo sản phẩm
          const productSales = topProducts.reduce((acc, detail) => {
              acc[detail.productId] = (acc[detail.productId] || 0) + detail.quantity;
              return acc;
          }, {});

          // Lấy top 5 sản phẩm bán nhiều nhất
          const sortedProducts = Object.entries(productSales)
              .sort((a, b) => b[1] - a[1])
              .slice(0, 5);

          // Lấy tên sản phẩm từ bảng Product
          const productNames = await prisma.product.findMany({
              where: { id: { in: sortedProducts.map(([productId]) => parseInt(productId)) } },
              select: { id: true, name: true },
          });

          const productMap = Object.fromEntries(productNames.map((p) => [p.id, p.name]));
          data.labels = sortedProducts.map(([productId]) => productMap[parseInt(productId)] || 'Không xác định');
          data.values = sortedProducts.map(([_, quantity]) => quantity);
          data.label = 'Sản phẩm bán nhiều nhất theo tháng';

      }  else {
          return res.status(400).send("Loại biểu đồ không hợp lệ");
      }

      res.json(data);
  } catch (error) {
      console.error("Error fetching chart data:", error);
      res.status(500).send("Có lỗi xảy ra khi lấy dữ liệu biểu đồ.");
  }
});


app.listen(3000, () => {
  console.log('Server is running on port 3000');
});
