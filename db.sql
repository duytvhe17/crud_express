CREATE DATABASE  IF NOT EXISTS `product` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `product`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: product
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('073223af-c722-4a89-9be5-4b4e91ccd1e4','8a0e598b12e641bfea29799eab4a5be9f492f757a81ca3660b7f73219eab81d2','2024-11-06 11:12:43.347','20241106111243_add_resolution_field',NULL,NULL,'2024-11-06 11:12:43.322',1),('1a14d2f9-1f29-40fb-8576-bb0b7b14e848','c4b0f671718f0a4391b1ff1b6a66a1560d77b7fdc87ee9b9fc3f1aa6b2a047d4','2024-11-05 02:25:52.447','20241105022552_add_user_personal_info',NULL,NULL,'2024-11-05 02:25:52.429',1),('21d263d5-bd66-4bdf-b663-6ce5e8f4e79e','17783f7f14779f8e1b51e8231437a977fb8bc23660ff98fbfdda981d905b7c8d','2024-10-18 07:29:45.455','20241018072945_make_user_id_nullable',NULL,NULL,'2024-10-18 07:29:45.215',1),('368ca748-c1a8-4c58-a005-4f79e21d45e6','8ec524649078cf55cf89011b34149ac65022350ef958585ab74367a7b76cfd0f','2024-11-04 02:22:12.327','20241104022212_add_image_price_quantity_to_product',NULL,NULL,'2024-11-04 02:22:12.307',1),('472a68bd-cb2c-4025-8d45-24133b74d975','6f23c39cd3ae4d1bf54cb30e24dab69ecb2f3d9b4d013f6aa6ba856cc16c6f4c','2024-11-12 04:44:43.196','20241112044443_add_category_model',NULL,NULL,'2024-11-12 04:44:43.093',1),('48be55c3-73c1-4a5e-968f-bb727ef78466','cd586659eb9a1733469f6c6177b652bcf8d5db59bf570268702f755c39ddbfd6','2024-11-05 01:40:47.086','20241105014047_update_imageurl_length',NULL,NULL,'2024-11-05 01:40:47.071',1),('5ab82d65-d3a3-452c-a82b-10dcd711414d','9a7409844861e2ea9b6ebd18e6c3938b2e52a986991e813e6003bafc7099e587','2024-10-23 08:18:02.105','20241023081802_allow_null_user_id',NULL,NULL,'2024-10-23 08:18:02.050',1),('706e1117-15f4-4ceb-9353-b66a8ba854a3','4629d08c1b7612dcb0e83613ffa238e2d0351e771bccd73a70ed5508b39e9294','2024-11-06 11:14:46.931','20241106111446_add_refresh_rate_field',NULL,NULL,'2024-11-06 11:14:46.911',1),('724b60f7-3ddc-4546-9278-6f644c1fcd73','c2c1e8907c460b02ef2aa124aed1837623eebce759fa7fa5ad525a3c2b779a35','2024-11-06 11:18:11.799','20241106111811_add_brightness_field',NULL,NULL,'2024-11-06 11:18:11.778',1),('9a815220-f60d-4edd-978e-171669171a0f','bf4b09b62d47c68351aa1cb9a40a457ceaf342085e278bcefcb730fc3d774828','2024-10-14 01:58:02.558','20241014015802_init',NULL,NULL,'2024-10-14 01:58:02.534',1),('aa85cc44-d229-443b-b81f-f0895b26dcb8','3e25dd77068f0c1a06d1f1161493f0750a3bb2036c30759f24706160090e8ade','2024-10-28 02:37:17.925','20241028023717_allow_null_password',NULL,NULL,'2024-10-28 02:37:17.775',1),('b2b2d056-848d-450f-bd0e-37a88ca495aa','f86e1bcdd5f5a549fe33bf093a77ada7db00f01d6e969f5ea8888eb50ed29b0b','2024-11-06 02:28:01.318','20241106022801_add_product_details_relation',NULL,NULL,'2024-11-06 02:28:01.261',1),('bc337804-0bc2-4c6c-b1f8-d2199869fa8d','1e48bb886b4166ce19a38b4361f46a7a1907da44216aac0c3335ff5b8e61cdad','2024-11-12 01:16:09.922','20241112011609_add_category_to_product',NULL,NULL,'2024-11-12 01:16:09.882',1),('f5112124-5dd3-4491-bcd2-9fccad2d21de','5ae72c6c96845857c3c9d17d176e26613f2abc938343ace6ed8ceb6a47e8efef','2024-11-05 02:56:21.340','20241105025621_add_order_models',NULL,NULL,'2024-11-05 02:56:21.219',1),('fb8342e4-852d-4aeb-a4de-7d5afb8da79f','a6a14116a03cafa0f4ce014f4682d47119d489e15d467ca0e62dda8e310c5a7c','2024-11-04 01:22:53.944','20241104012253_add_cart_functionality',NULL,NULL,'2024-11-04 01:22:53.781',1),('fc383586-152f-4828-a886-f0f3bb1f90c5','73dfd192ab462c45d6957d0189073895c39ca17876c784c4c1a828e98733b939','2024-11-12 04:54:55.440','20241112045455_add_category_model',NULL,NULL,'2024-11-12 04:54:55.421',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Cart_userId_key` (`userId`),
  CONSTRAINT `Cart_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,5),(3,6),(2,11);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartitem`
--

DROP TABLE IF EXISTS `cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartitem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productId` int NOT NULL,
  `quantity` int NOT NULL,
  `cartId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CartItem_productId_fkey` (`productId`),
  KEY `CartItem_cartId_fkey` (`cartId`),
  CONSTRAINT `CartItem_cartId_fkey` FOREIGN KEY (`cartId`) REFERENCES `cart` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `CartItem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitem`
--

LOCK TABLES `cartitem` WRITE;
/*!40000 ALTER TABLE `cartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Điện thoại','https://www.clipartmax.com/png/middle/246-2461247_phone-call-icon-clipart-panda-icon-%C4%91i%E1%BB%87n-tho%E1%BA%A1i-di-%C4%91%E1%BB%99ng.png'),(2,'Laptop','https://cdn-icons-png.flaticon.com/512/595/595355.png'),(3,'Tablet','https://cdn-icons-png.flaticon.com/512/1530/1530457.png'),(4,'Phụ kiện','https://phukiengiaxuong.com.vn/cdn/upload/images/icon-menu/nocolor/power-bank.svg'),(5,'Máy cũ','https://macstores.vn/wp-content/uploads/2017/01/icon-02.jpg');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `originalname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `File_productId_fkey` (`productId`),
  CONSTRAINT `File_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `total` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Order_userId_fkey` (`userId`),
  CONSTRAINT `Order_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (10,5,'2024-11-11 01:56:50.803',3000000),(12,5,'2024-11-12 01:11:26.988',18000000),(13,5,'2024-11-14 01:45:51.698',51650000),(14,6,'2024-11-14 01:46:42.277',18000000),(15,6,'2024-11-14 01:47:04.064',18000000),(16,5,'2024-11-22 02:16:51.138',67000000),(17,5,'2024-11-27 00:56:50.547',10490000),(18,5,'2024-12-04 01:24:22.141',23000000);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `productId` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `OrderDetail_orderId_fkey` (`orderId`),
  KEY `OrderDetail_productId_fkey` (`productId`),
  CONSTRAINT `OrderDetail_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `OrderDetail_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES (11,10,15,1),(13,12,12,1),(14,13,50,1),(15,13,22,1),(16,14,12,1),(17,15,12,1),(18,16,12,1),(19,16,22,1),(20,17,28,1),(21,18,13,1);
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` int NOT NULL,
  `imageUrl` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `categoryId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Product_userId_fkey` (`userId`),
  KEY `Product_categoryId_fkey` (`categoryId`),
  CONSTRAINT `Product_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Product_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (12,'iphone ','https:/example1',5,'https://cdn2.cellphones.com.vn/x/media/catalog/product/b/_/b_c_1_9.png',18000000,3,NULL),(13,'samsung','https://www.samsung.com/vn',5,'https://cdn.tgdd.vn/Products/Images/42/320721/samsung-galaxy-z-fold6-xam-thumbn-600x600.jpg',23000000,49,NULL),(14,'oppo','https:/example1',5,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSO17lvYu0dQLIHQt8jugWmBCWqmMq_Se5apQ&s',10000000,99,NULL),(15,'nokia','https:/example6',5,'https://cdn2.cellphones.com.vn/x/media/catalog/product/n/o/nokia-c2-ra-mat-3_2_2_2.png',3000000,198,NULL),(16,'reami','https://www.apple.com/vn',5,'https://cdn.viettablet.com/images/detailed/60/xiaomi-redmi-12-1.png',4500000,19,NULL),(18,'iphone 15','https://www.apple.com/vn',5,'https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iphone_15/dien-thoai-iphone-15-20.jpg',21000000,20,NULL),(20,'iphone 14','https://www.apple.com/vn',5,'https://cdn.tgdd.vn/Products/Images/42/320721/samsung-galaxy-z-fold6-xam-thumbn-600x600.jpg',13000000,20,NULL),(22,'samsung a05','https://www.apple.com/vn',5,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSO17lvYu0dQLIHQt8jugWmBCWqmMq_Se5apQ&s',49000000,18,NULL),(23,'oppo a05','https://www.samsung.com/vn',5,'https://cdn2.cellphones.com.vn/x/media/catalog/product/n/o/nokia-c2-ra-mat-3_2_2_2.png',3000000,50,NULL),(25,'MacBook Air M1','https://hoanghamobile.com/lap-top/macbook-air-13-inch-2020-256gb-chinh-hang-apple-viet-nam-phien-ban-moi',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/06/25/mac-m1-xam-1.png',17990000,50,2),(26,'Laptop ASUS Vivobook 14','https://hoanghamobile.com/laptop/laptop-asus-vivobook-14-x1404za-nk386w',5,'https://cdn.hoanghamobile.com/i/preview-np-V2/Uploads/ImageHightlight/5033_laptop-asus-vivobook-14-x1404za-nk386w/55819-laptop-asus-vivobook-14-x1404za-nk386w-thumb.jpg',8990000,50,2),(27,'Laptop Gaming MSI GF63 ','https://hoanghamobile.com/laptop/laptop-gaming-msi-gf63-12ucx-841vn-chinh-hang',5,'https://cdn.hoanghamobile.com/i/preview-np-V2/Uploads/ImageHightlight/3877_laptop-gaming-msi-gf63-12ucx-841vn-chinh-hang/artboard-1.png',14390000,50,2),(28,'Laptop MSI Modern 14 ','https://hoanghamobile.com/laptop/laptop-msi-modern-14-c7m-221vn-chinh-hang',5,'https://cdn.hoanghamobile.com/i/preview-np-V2/Uploads/ImageHightlight/3875_laptop-msi-modern-14-c7m-221vn-chinh-hang/artboard-1.png',10490000,99,2),(29,'Laptop MSI Modern 15','https://hoanghamobile.com/laptop/laptop-msi-modern-15-b13m-438vn',5,'https://cdn.hoanghamobile.com/i/preview-np-V2/Uploads/ImageHightlight/4729_laptop-msi-modern-15-b13m-438vn/artboard-1.png',13490000,20,2),(30,'Laptop Gaming MSI Cyborg 15','https://hoanghamobile.com/laptop/laptop-gaming-msi-cyborg-15-a12vf-267vn-chinh-hang',5,'https://cdn.hoanghamobile.com/i/preview-np-V2/Uploads/ImageHightlight/3496_laptop-gaming-msi-cyborg-15-a12vf-267vn-chinh-hang/artboard-1.png',21990000,30,2),(31,'Laptop Lenovo LOQ','https://hoanghamobile.com/laptop/laptop-lenovo-loq-15iax9-83gs001rvn-chinh-hang',5,'https://cdn.hoanghamobile.com/i/preview-np-V2/Uploads/ImageHightlight/4102_laptop-lenovo-loq-15iax9-83gs001rvn-chinh-hang/artboard-1.png',20890000,30,2),(32,'Laptop MSI Katana 15','https://hoanghamobile.com/laptop/laptop-msi-katana-15-b13vfk-676vn-chinh-hang',5,'https://cdn.hoanghamobile.com/i/preview-np-V2/Uploads/ImageHightlight/4144_laptop-msi-katana-15-b13vfk-676vn-chinh-hang/artboard-1.png',27990000,100,2),(33,'Laptop Dell Inspiron 15 3520','https://hoanghamobile.com/laptop/dell-inspiron-15-3520-71043874',5,'https://cdn.hoanghamobile.com/i/preview-np-V2/Uploads/ImageHightlight/5562_dell-inspiron-15-3520-71043874/artboard-1.png',14990000,200,2),(34,'Laptop Dell XPS 13 9340','https://hoanghamobile.com/laptop/laptop-dell-xps-13-9340-71034922',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/10/17/71034922-2.png',49990000,10,2),(35,'Laptop Dell Gaming G15 5530','https://hoanghamobile.com/laptop/laptop-dell-gaming-g15-5530-71045030',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/10/17/71045030-1.png',35490000,22,2),(36,'Laptop Gaming Lenovo LOQ 15ARP9','https://hoanghamobile.com/laptop/laptop-gaming-lenovo-loq-15arp9-83jc007hvn',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/10/24/83jc007hvn-1.png',20990000,25,2),(37,'Laptop LG Gram 14Z90R-G.AH53A5','https://hoanghamobile.com/laptop/laptop-lg-gram-14z90r-g-ah53a5',5,'https://cdn.hoanghamobile.com/i/preview-np-V2/Uploads/ImageHightlight/5921_laptop-lg-gram-14z90r-g-ah53a5/artboard-1.png',21690000,50,2),(38,'Lenovo Tab M9','https://hoanghamobile.com/may-tinh-bang/lenovo-tab-m9-4g-lte-4gb-64gb',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2023/10/23/lenovo-tab-m9.png',3390000,100,3),(39,'iPad Air 6 M2','https://hoanghamobile.com/may-tinh-bang/ipad-air-6-m2-11-wifi-128gb',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/05/08/ipad-air-6-m2-space-gray-1.png',15590000,200,3),(40,'iPad Pro M4','https://hoanghamobile.com/may-tinh-bang/ipad-pro-m4-13-wifi-256gb',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/05/08/ipad-pro-m4-2.png',36390000,50,3),(41,'iPad Mini 7 2024','https://hoanghamobile.com/may-tinh-bang/ipad-mini-7-wifi-256gb',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/11/04/ipad-mini-7-xam-wifi-1.png',16.49,100,3),(42,'Máy tính bảng Lenovo Tab M11','https://hoanghamobile.com/may-tinh-bang/lenovo-tab-m11-zadb0134vn-4gb-64gb-xam-chinh-hang',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/03/12/lenovo-tab-m11-zadb0134vn-1.png',4890000,200,3),(43,'Máy tính bảng iPad Gen 9','https://hoanghamobile.com/may-tinh-bang/apple-ipad-gen-9-10-2-2021-wifi-64gb-chinh-hang-apple-viet-nam',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/06/24/gen-9-trang-1.png',6990000,100,3),(44,'Máy tính bảng iPad Gen 10','https://hoanghamobile.com/may-tinh-bang/apple-ipad-gen-10-10-9-2022-wifi-64gb-chinh-hang-apple-vn',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/09/09/gen-10-bac-1.jpg',8890000,100,3),(45,'Apple iPad Air 5 M1','https://hoanghamobile.com/may-tinh-bang/apple-ipad-air-m1-10-9-2022-wifi-64gb-chinh-hang-apple-viet-nam',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/06/24/air-5-xanh-1.png',13990000,120,3),(46,'Máy tính bảng iPad Pro M2','https://hoanghamobile.com/may-tinh-bang/apple-ipad-pro-m2-11-5g-128gb-chinh-hang-apple-viet-nam',5,'https://cdn.hoanghamobile.com/i/preview-h-V2/Uploads/2024/06/25/m2-pro-den-2.png',23590000,50,3),(47,' Samsung Galaxy Tab S9','https://hoanghamobile.com/may-tinh-bang/samsung-galaxy-tab-s9-wifi-8gb-128gb-chinh-hang',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2023/07/26/samsung-galaxy-tab-s9-5g-13.png',19990000,100,3),(48,' Lenovo Tab P11 Plus','https://hoanghamobile.com/may-tinh-bang/lenovo-tab-p11-plus-4gb-64gb-chinh-hang',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2023/08/25/lenovo-tab-p11-plus-gray-1.png',5250000,150,3),(49,'HTC A103','https://hoanghamobile.com/may-tinh-bang/may-tinh-bang-htc-a103-4gb-64gb-chinh-hang',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2023/08/24/htc-a103-6.png',1990000,200,3),(50,'Ram Laptop Kingston','https://hoanghamobile.com/phu-kien/ram-laptop-kingston-kvr48s40bd8-32-32gb-1x32gb-ddr5-4800mhz',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/09/13/kingston-kvr48s40bd8-32-1.png',2650000,999,4),(51,' Baseus Heyo Series II','https://hoanghamobile.com/phu-kien/thiet-bi-phat-hien-camera-hieu-baseus-heyo-series-ii',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/09/16/baseus-heyo-series-ii-1.png',299000,500,4),(52,'Office Home 2024','https://hoanghamobile.com/phan-mem/office-home-2024',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/09/24/office-home-2024-1.png',229000,1000,4),(53,' Logitech Pebble keys 2 K380s','https://hoanghamobile.com/ban-phim/ban-phim-khong-day-logitech-pebble-keys-2-k380s',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/09/12/k380s-1.png',790000,200,4),(54,'Củ sạc Apple ','https://hoanghamobile.com/cu-sac/cu-sac-apple-2-cong-type-c-35w-mnwp3za',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/10/26/mnwp3za-1.png',1250000,2000,4),(55,'Cáp Sạc Apple','https://hoanghamobile.com/day-cap/cap-sac-apple-usb-c-60w-day-du-1m-mw493za-a-chinh-hang-apple',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/10/12/cap-sac-apple-usb-c-60w-1m-1.jpg',490000,2000,4),(56,'Giá treo 2 màn hình','https://hoanghamobile.com/phu-kien-man-hinh-may-tinh/gia-treo-2-man-hinh-gan-ban-ez3-17-27inch',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/10/28/ez3-3.jpg',460000,1000,4),(57,'Router Wifi mini ','https://hoanghamobile.com/phu-kien/router-wifi-mini-totolink-n200re-chuan-n-300mbps',5,'https://cdn.hoanghamobile.com/i/preview-np-V2/Uploads/ImageHightlight/6112_router-wifi-mini-totolink-n200re-chuan-n-300mbps/anb-n200re-0.jpg',269000,500,4),(58,'Switch Totolink S808G','https://hoanghamobile.com/phu-kien/bo-chia-mang-switch-totolink-s808g-8-cong',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/10/29/s808g-1.png',369,200,4),(59,' Brother HL-B2180DW','https://hoanghamobile.com/phu-kien/may-in-brother-hl-b2180dw',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/09/14/b2180dw-1.png',4790000,50,4),(60,' Balo ','https://hoanghamobile.com/phu-kien/balo-hoang-ha-2024',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/09/10/balo-hoang-ha-2024-1.png',179000,100,4),(61,'Photo Printer-Z1','https://hoanghamobile.com/may-in/may-chup-anh-lay-lien-hprt-z1-chinh-hang',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/11/12/1_638670162353239585.png',2590000,100,4),(62,' Realme RMX3930','https://hoanghamobile.com/kho-san-pham-cu/realme-c61-4-128gb-tbh-p55003',5,'https://cdn.hoanghamobile.com/i/preview/Uploads/2024/08/20/a3764cb5-2f49-484e-979a-76e15501aa05.jpg',2990000,2,5),(63,'REDMI NOTE 13','https://hoanghamobile.com/kho-san-pham-cu/dien-thoai-di-dong-redmi-note-13-6-67-snap-685-6g-128g-108m-8m-uw-2m-macro-16mp-5000mah-23129raa4g-vang-6941812762417-86997-p44857',5,'https://cdn.hoanghamobile.com/i/preview/Uploads/2024/01/03/redmi-note-13-black-2.png',3690000,1,5),(64,'Iphone 11 Pro Max 256GB - Cũ','https://hoanghamobile.com/kho-san-pham-cu/iphone-11-pro-max-256gb-chinh-hang-vn-a-cu-p54932',5,'https://cdn.hoanghamobile.com/i/preview/Uploads/2020/10/10/iPhone%2011%20Pro%20(6).png',9900000,2,5),(65,'Honor X6b (6+128GB)','https://hoanghamobile.com/kho-san-pham-cu/honor-x6b-6gb-128gb-tbh-p51378',5,'https://cdn.hoanghamobile.com/i/preview/Uploads/2024/08/06/x6b-1.png',3400000,2,5),(66,'Z Fold5, SM-F946B','https://hoanghamobile.com/kho-san-pham-cu/samsung-galaxy-z-fold5-12gb-512gb-tbh-p44460',5,'https://cdn.hoanghamobile.com/i/preview/Uploads/2024/03/29/z-fold5-3.png',29370000,2,5),(67,'iPhone 16 Pro Max','https://hoanghamobile.com/dien-thoai/iphone-16-pro-max',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/09/10/iphone-16-pro-tu-nhien-1.png',34190000,100,1),(68,'Samsung Galaxy Z Fold6','https://hoanghamobile.com/dien-thoai/samsung-galaxy-z-fold6-12gb-512gb',5,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/07/10/z-fold6-silver-shadow-1.png',45990000,200,1),(69,'iPhone 16 (256GB)','https://hoanghamobile.com/dien-thoai/iphone-16-256gb',12,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/09/10/iphone-16-hong-1.png',24.99,100,1),(70,'OSCAL TIGER 12','https://hoanghamobile.com/dien-thoai/oscal-tiger-12-8-8gb-128gb',12,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/04/02/oscal-tiger-12-gray-1_638476621673253650.png',3490000,200,1),(71,'Samsung Galaxy S24 FE','https://hoanghamobile.com/dien-thoai/samsung-galaxy-s24-fe-8gb-128gb',12,'https://cdn.hoanghamobile.com/i/preview-h-V2/Uploads/2024/09/25/sm-s721-galaxys24fe-graphite-back.png',16990000,100,1),(72,'Vivo Y19S','https://hoanghamobile.com/dien-thoai/vivo-y19s-8-128gb',12,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/10/16/vivo-y19s-bac-1.png',4790000,200,1),(73,'iPhone 15 Pro Max ','https://hoanghamobile.com/dien-thoai-di-dong/apple-iphone-15-pro-max-256gb-chinh-hang-vn-a',12,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/06/24/15-pro-max-xanh-2.png',28690000,500,1),(74,'HONOR X7c','https://hoanghamobile.com/dien-thoai/honor-x7c-8gb-256gb',12,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/11/04/x7c-den.png',5490000,1000,1),(75,'Xiaomi Redmi 14C ','https://hoanghamobile.com/dien-thoai/xiaomi-redmi-14c-4gb-128gb',12,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/08/26/c3n-blue-back.png',2990000,100,1),(76,'Vivo Y100','https://hoanghamobile.com/dien-thoai/vivo-y100-8-256gb',12,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/10/09/vivo-y100-den-1.png',6490000,100,1),(77,'HONOR X6b','https://hoanghamobile.com/dien-thoai/honor-x6b-6-128gb',12,'https://cdn.hoanghamobile.com/i/previewV2/Uploads/2024/07/19/honor-x6b-den-1.png',3790000,123,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productdetails`
--

DROP TABLE IF EXISTS `productdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productdetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productId` int NOT NULL,
  `screen` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `camera` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `memoryStorage` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designWeight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `battery` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connectivity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utilities` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resolution` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refreshRate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brightness` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `displayTechnology` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ProductDetails_productId_key` (`productId`),
  CONSTRAINT `ProductDetails_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productdetails`
--

LOCK TABLES `productdetails` WRITE;
/*!40000 ALTER TABLE `productdetails` DISABLE KEYS */;
INSERT INTO `productdetails` VALUES (1,12,'','','','','','','5500','','','','','',''),(2,13,'','','','','128G','','','','','','','',''),(3,25,' 13.3 inch',' 720p FaceTime HD camera','Đang cập nhật',' macOS','RAM 8GB, Ổ cứng mặc định 256GB SSD','Trọng lượng 1.29kg, Kích thước 304.1 x 212.4 x 4.1 ~ 16.1 (mm)','Dung lượng pin Pin lithium-polymer 49.9Wh','Các cổng giao tiếp 2 x Thunderbolt / USB 4, 3.5mm headphone jack, Kết nối không dây Wi-Fi 6, Bluetooth 5.0','Đang cập nhật',' 2560x1600','60Hz','Không',' Retina Display, True Tone'),(4,26,'324.9 x 213.9 x 17.9 mm',' 720p HD camera, With privacy shutter','Laptop ASUS Vivobook 14 X1404ZA-NK386W (i3-1215U/8GB/512GB/14.0 FHD/WIN11/Xanh) - Chính hãng',' Windows 11 Home','Ổ cứng mặc định 512GB SSD, RAM 8GB','Trọng lượng 1.40 kg, Kích thước 324.9 x 213.9 x 17.9 mm','Dung lượng pin 42WHrs, 3S1P, Li-ion 3 pin','Kết nối không dây Wi-Fi 6E(802.11ax), Bluetooth® 5.3','Đang cập nhật',' 1920×1080',' 60Hz',' IPS','Tỷ lệ khung hình 16:9, Đèn nền LED, 250nits, Dải màu 45% NTSC, màn hình chống chói, Được chứng nhận bởi TÜV Rheinland, (Tỷ lệ màn hình trên thân máy)82%'),(5,27,' 15.6 inch','HD Camera','GF63 12UCX-841VN (i5-12450H/8GB/512GB/RTX 2050/15.6\" FHD 144Hz/Windows 11) - Chính hãng','Windows 11 Home','RAM 8GB, Ổ cứng mặc định 512GB SSD','Kích thước 359 x 254 x 21.7 mm, Trọng lượng 1.86kg','52.4 Wh','Kết nối không dây 802.11 ax Wi-Fi 6 + Bluetooth v5.2','Chất liệu Mặt lưng và chiếu nghỉ tay kim loại','1920x1080','144Hz','IPS','Thin Bezel, 45%NTSC'),(6,28,'14 inch','720p HD',' C7M- 221VN (R7-7730U/8GB/512GB/14\" FHD/Windows 11) - Chính hãng','Windows 11 Home','RAM 8GB, Ổ cứng mặc định 512GB SSD','Kích thước 319.9 x 223 x 19.35 mm, Trọng lượng 1.4kg','3 cell, 39Whr','Kết nối không dây 802.11ax Wifi 6E, Bluetooth 5.2','Đang cập nhật','1920x1080','60Hz','IPS','45% NTSC, Thin Bezel, 65% sRGB'),(7,29,' 15.6 inch','HD (30fps@720p)','B13M-438VN (i5-1335U/8GB/512GB/15.6\"FHD/Win11) - Chính hãng','Windows 11 Home','RAM 8GB DDR4, Ổ cứng mặc định 512GB SSD','Kích thước 359 x 241 x 19.9 mm, Trọng lượng 1.7 kg','3 cell / 39.3 Whr','Kết nối không dây Bluetooth v5.2 Intel Wi-Fi 6 AX201',' Tích hợp bộ phần mềm Microsoft Office Home & Student 2021 bản quyền','1920x1080','60Hz','IPS','Đang cập nhật'),(8,30,'15.6 inch','HD type (30fps@720p)','A12VF-267VN (i7-12650H/8GB/512GB/RTX 4060/15.6\" FHD 144Hz/Windows 11) - Chính hãng','Windows 11 Home','RAM 8GB, Ổ cứng mặc định 512GB SSD, Khả năng nâng cấp ổ cứng Có thể nâng cấp SSD lên dung lượng cao hơn','Kích thước 359.36 x 250.34 x 21.95~22.9 mm, Trọng lượng 1.98kg',' 3 cell / 53.5 Whr','Kết nối không dây Intel Wi-Fi 6 AX201 Gigabit LAN Bluetooth v5.2','Chất liệu Vỏ nhựa - nắp lưng bằng kim loại','1920x1080','144Hz','IPS','IPS-Level, 45% NTSC'),(9,31,' 15.6 inch','FHD 1080p, có màn che vật lý','15IAX9 (83GS001RVN) - (i5-12450HX/12GB/512GB/RTX 3050/15.6\" FHD/Windows 11) - Chính hãng','Windows 11','RAM 12GB, Ổ cứng mặc định 512GB SSD','Kích thước 359.86 x 258.7 x 21.9-23.9 mm, Trọng lượng 2.38kg','60Wh','Kết nối không dây Wi-Fi 6 802.11ax 2x2 + Bluetooth 5.2',' Hợp kim nhựa PC + ABS dẻo dai, chống va đập','1920x1080','144Hz','IPS','Độ sáng tối đa 350nits Màn hình chống chói Độ phủ màu 100% sRGB Advanced Optimus NVIDIA G-SYNC TÜV Low Blue Light (phần mềm)'),(10,32,'15.6 inch','720p HD camera',' B13VFK-676VN (i7-13620H/16GB/1TB/RTX 4060/15.6\" FHD 144Hz/Windows 11/Ba lô) - Chính hãng','Windows 11 Home','RAM 16GB, Ổ cứng mặc định 1TB SSD','Kích thước 359 x 259 x 24.9 mm, Trọng lượng 2.25kg','53.5 Whrs','Kết nối không dây Intel Wi-Fi 6 AX201 Bluetooth v5.2','Công nghệ âm thanh 2 loa 2W Nahimic 3 Audio Enhancer Hi-Res Audio Ready, Card đồ hoạ rời RTX 4060','1920x1080','144Hz','IPS','Độ phủ màu 45% NTSC'),(11,33,'15.6 inch','720p at 30 fps HD camera','i5-1235U/8GB/512GB/15.6 FHD/Win 11+Office/Đen','Windows 11','RAM 8GB, Ổ cứng mặc định 512GB SSD','Kích thước 358.5 x 235.56 x 16.96 mm, Trọng lượng 1.9 kg','3 cell / 41 Whr','Kết nối không dây Bluetooth 5.2','Phần mềm sẵn có Office Home & Student 2021','1920×1080','120Hz','Đang cập nhật','WVA'),(12,34,'13.4 inch','1080p at 30 fps FHD RGB camera, Dual-array microphones','Ultra 5 125H/16GB/1TB/Intel Arc/13.4 inch FHD+/Win 11+Office/Bạc','Windows 11Home','RAM 16GB, Ổ cứng mặc định 1TB SSD, Khả năng nâng cấp ổ cứng (Có thể tháo ra, lắp thanh khác tối đa 2 TB)','Kích thước 15.3 X 295.3 X 199.1 mm, Trọng lượng 1.19 kg','3Cell 55WHrs','Kết nối không dây Intel® Killer™ Wi-Fi 7 1750 (BE200) 2x2 Bluetooth','Công nghệ màn hình Anti-Glare 500nits EyeSafe, Hỗ trợ cảm ứng Cảm ứng đa điểm','1920 x 1200','Đang cập nhật','FHD+','Anti-Glare 500nits EyeSafe'),(13,35,'15.6 inch','720p HD với micro','i7-13650HX/16GB/512GB/RTX 3050/15.6 inch FHD 165Hz/Win 11+ Office/Xám','Windows 11 Home','RAM 16GB, Ổ cứng mặc định 1TB SSD, Khả năng nâng cấp ổ cứng (Có thể tháo ra, lắp thanh khác tối đa 1 TB)','Kích thước 357.26 x 274.52 x 21.28 - 26.15 mm, Trọng lượng 2.81 kg','86WHrs, Li-ion 6 pin','Kết nối không dây Wi-Fi 6 (Wi-Fi 802.11ax) Bluetooth 5.2','Công nghệ âm thanh Realtek ALC3204, Card đồ hoạ rời RTX 3050','1920x1080','165Hz','WVA','Độ sáng 300 nit Tính năng ComfortView Plus Màn hình chống chói Đèn nền LED Khả năng hiển thị màu sắc: 100% sRGB'),(14,36,'15.6 inch','HD 720p with E-shutter','R5 7235HS/12GB/512GB/RTX 3050/15.6 inch FHD/Win 11/Xám','Windows® 11 Home Single Language','RAM 12GB, Ổ cứng mặc định 512GB SSD, Khả năng nâng cấp ổ cứng 2 Slots: M2 2242 PCIe 4.0 x4 Slot/ M.2 2280 PCIe 4.0 x4 Slot','Kích thước 359.86 x 258.7 x 21.9-23.9 mm, Trọng lượng 2.38 kg','Integrated 60Wh (4 Cell)','Kết nối không dây Wi-Fi® 6, 11ax 2x2 + BT5.2','Card đồ hoạ rời RTX 3050, Công nghệ âm thanh Stereo speakers, 2W x2, optimized with Nahimic Audio','1920x1080','144Hz','FHD','300nits Anti-glare, 100% sRGB, G-SYNC®'),(15,37,'14 inch',' Full HD Webcam Camera IR','i5 1340P/16GB/256GB/14\"WUXGA/Win11/Xám',' Windows 11 Home SL','RAM 16GB, Ổ cứng mặc định 256GB SSD','Kích thước 312 x 213.9 x 16.8 mm, Trọng lượng 0.999 kg',' Li-ion, 72 Wh','Kết nối không dây Wi-Fi 6 (802.11ax) Bluetooth 5.1','Công nghệ âm thanh High Definition (HD) Audio Dolby Atmos, Card on-board Intel Iris Xe Graphics','1920 x 1200','60 Hz','IPS','350 nits Tấm nền IPS Chống chói Anti Glare'),(16,38,'9 inch','Sau:  8.0 MP, Trước:  2.0 MP','4G/LTE (4GB/64GB)','Android 12','RAM 4GB, Bộ nhớ trong 64GB','Kích thước 215.43 x 136.76 x 7.99 mm, Trọng lượng 344 g','Dung lượng pin 5100 mAh','Cổng kết nối/sạc Type-C, Jack tai nghe 3.5 mm','Sản phẩm bao gồm Dây cáp sạc Dock sạc Sách HDSD',' 1340 x 800','60Hz','Không',' IPS LCD'),(17,39,'11 inch','Độ phân giải Camera Wide 12MP, khẩu độ ƒ/1.8, Camera trước Ultra Wide 12MP trên cạnh ngang Khẩu độ ƒ/2.4','11\" Wifi (128GB) - Chính hãng Apple VN',' iPadOS 17','RAM 8GB, Bộ nhớ trong 128GB','Kích thước 247,6mm x 178,5mm x 6,1mm, Trọng lượng 462 g','Dung lượng pin 28.93 Wh, Loại pin Li-Po','Cổng kết nối/sạc Type-C','Ghi âm Hai micrô để gọi, quay video và ghi âm','2360x1640 pixel','60Hz','Đang cập nhật','Màn hình Multi-Touch với công nghệ LED nền và IPS'),(18,40,'13 inch',' Camera Wide 12MP, khẩu độ ƒ/1.8, Camera Ultra Wide 12MP trên cạnh ngang Khẩu độ ƒ/2.4',' 13\" Wifi (256GB) - Chính hãng Apple VN',' iPadOS 17, Chip xử lý (CPU) M4','RAM 8GB, Bộ nhớ trong 256GB','Kích thước 281,6mm x 215,5mm x 5,1mm, Trọng lượng 582 g','Loại pin Li-Po, Dung lượng pin 38,99 Wh','Cổng kết nối/sạc Type-C','Tính năng đặc biệt Bốn micrô phối hợp chuẩn studio để gọi, quay video và ghi âm Chế độ Chân Dung trong video FaceTime Âm Thanh Không Gian Chế độ micrô Tách Lời Nói và Âm Phổ Rộng',' 2752x2064 pixel','Công nghệ ProMotion từ 10Hz đến 120Hz','Đang cập nhật','Ultra Retina XDR'),(19,41,'8.3 inch','Camera góc rộng 12MP  Khẩu độ f/1.8  Ống kính 5 thành phần, Camera góc siêu rộng 12MP  Khẩu độ f/2.4','8.3\" Wifi (256GB) - Chính hãng Apple Việt Nam','iPadOS 18','Dung lượng  128GB','Kích thước  195.4 x 134.8 x 6.3 mm, Trọng lượng  297g','Tích hợp pin sạc Li-Po 19.3 WHrs','Hỗ trợ Apple Pencil Pro, Apple Pencil (USB‑C)  Tính năng lướt của Apple Pencil  Hỗ trợ bàn phím Bluetooth','Multi-Touch với công nghệ LED nền và IPS  Độ sáng 500 nit  Dải màu rộng (P3)  True Tone  Công nghệ ép kín  Lớp phủ chống phản chiếu  Lớp phủ kháng dầu chống in dấu vân tay','2266x1488','Đang cập nhật','Đang cập nhật','Liquid Retina'),(20,42,' 11 inch','Sau:  8.0 MP, Trước:  8.0 MP','ZADB0134VN (4GB/64GB) - Chính hãng','Android 13','RAM 4GB, Bộ nhớ trong 64GB','Kích thước 255.26 x 166.31 x 7.15 mm, Trọng lượng 465 g','Dung lượng pin 7040 mAh','Cổng kết nối/sạc Type-C','Đang cập nhật',' 1920x1200','90Hz','Đang cập nhật',' IPS LCD'),(21,43,' 10.2 inch','Sau:  8.0 MP, Trước:  12.0 MP','10.2\" Wi-Fi (64GB) - Chính hãng Apple Việt Nam','iPadOS','RAM 3GB, Bộ nhớ trong 64GB','Kích thước 250.6 mm x 174.1 mm x 7.5 mm, Trọng lượng 487 g','Dung lượng pin 32.4 Wh (~ 8600 mAh)','Cổng kết nối/sạc Lightning','Đang cập nhật','1620 x 2160',' 60Hz','Đang cập nhật',' IPS LCD'),(22,44,' 10.9 inch',' 12MP Wide camera, ƒ/1.8 aperture, ','10.9\" Wi-Fi (64GB) - Chính Hãng Apple Việt Nam',' iPadOS 16','RAM 4GB, Bộ nhớ trong 64GB','Kích thước 248.6 x 179.5 x 7 mm, Trọng lượng 477 g',' 28.6 Wh','Cổng kết nối/sạc Type-C','Đang cập nhật','2360-by-1640-pixel resolution at 264 pixels per inch (ppi) 500 nits brightness',' 60Hz','Đang cập nhật',' Liquid Retina HD'),(23,45,' 10.9 inch','Sau:  12.0 MP, Trước:  12.0 MP',' 10.9\" - 2022 - Wifi - 64GB - Chính Hãng Apple Việt Nam',' iPadOS 15','RAM 8GB, Bộ nhớ trong 64GB','Kích thước 247.6 mm x 178.5 mm x 6.1 mm, Trọng lượng 461 g','28.6 Wh','Cổng kết nối/sạc Type-C','Tính năng đặc biệt Kết nối Apple Pencil 2 Kết nối bàn phím rời Micro kép Mở khóa bằng vân tay Nam châm & sạc cho Apple Pencil',' 1640 x 2360 Pixels',' 60Hz','Đang cập nhật',' Retina IPS LCD'),(24,46,' 11 inch','Sau: Wide: 12MP, ƒ/1.8 aperture Ultra Wide: 10MP, ƒ/2.4 aperture','11\" 5G (128GB) - Chính hãng Apple Việt Nam',' iPadOS','Bộ nhớ trong 128GB, RAM 8GB','Kích thước 247.6 x 178.5 x 5.9 mm, Trọng lượng 466 g',' 28,65 Wh','Cổng kết nối/sạc Type-C','Đang cập nhật',' 2388-by-1668-pixel resolution at 264 pixels per inch (ppi)',' Công nghệ ProMotion từ 10Hz đến 120Hz','Đang cập nhật',' Liquid Retina display'),(25,47,'11 inch','Sau:  13 MP, Quay phim 4K 2160p@30fps, Camera trước:  Độ phân giải 12 MP','Wifi 8GB/128GB - Chính hãng','Android 13','RAM 8GB, Bộ nhớ trong 128GB','Kích thước 254.3 mm x 165.8 mm x 5.9 mm, Trọng lượng 498 g',' 8.400 mAh','Cổng kết nối/sạc Type-C','Tính năng đặc biệt 4 loa stereo Samsung DeX (Giao diện tương tự PC) Âm thanh Dolby Atmos Âm thanh AKG Mở khoá vân tay dưới màn hình Vision Booster Kháng nước IP68',' 1600 x 2560 Pixels',' 120Hz','Đang cập nhật',' Dynamic AMOLED 2X'),(26,48,' 11 inch','Camera sau Độ phân giải 13MP, Camera trước Độ phân giải 8MP','Đang cập nhật','Android™ 11 or later','RAM 4GB, Bộ nhớ trong 64GB','Kích thước 258.4m x 163mm x 7.5mm, Trọng lượng 490 g',' 7700 mAh','Cổng kết nối/sạc Type-C','Đang cập nhật','2K (2000 x 1200) touchscreen','60Hz','Đang cập nhật','IPS LCD'),(27,49,'10.1 inch','Camera sau: Độ phân giải 5.0MP, Camera trước: Độ phân giải 5.0MP','10\" - 4G LTE - (4GB/64GB) - Chính hãng',' Android 12','RAM 4GB, Bộ nhớ trong 64GB','Kích thước 244 x 162.6 x 8.5 mm, Trọng lượng 440 g',' 6000 mAh','Cổng kết nối/sạc Type-C','Sản phẩm bao gồm Máy tính bảng củ sạc dây sạc Hướng dẫn sử dụng dụng cụ tháo sim Không có tai nghe','1280 x 800','60Hz','Đang cập nhật','LCD'),(28,50,'','','(KVR48S40BD8-32) 32GB (1x32GB) DDR5 4800MHz - Chính hãng','','','','','','','','','',''),(29,51,'','','Thiết bị phát hiện camera','','','','','','','','','',''),(30,52,'','','Phần mềm Office Home 2024','','','','','','','','','',''),(31,53,'','','Bàn phím không dây Logitech Pebble keys 2 K380s - Chính hãng','','','','','','','','','',''),(32,54,'','','Củ sạc Apple 2 cổng Type-C 35W - MNWP3ZA - Chính hãng Apple','','','','','','','','','',''),(33,55,'','','Cáp Sạc Apple USB-C 60W Dây Dù (1m) MW493ZA - Chính hãng Apple','','','','','','','','','',''),(34,56,'','','Giá treo 2 màn hình gắn bàn EZ3 (17-27inch) - Chính hãng','','','','','','','','','',''),(35,57,'','','Router Wifi mini Totolink N200RE chuẩn N 300Mbps – Chính hãng','','','','','','','','','',''),(36,58,'','','Bộ chia mạng Switch Totolink S808G 8 cổng – Chính hãng','','','','','','Miễn phí vận chuyển toàn quốc Bảo hành 24 tháng chính hãng 1 đổi 1 trong 15 ngày đầu nếu có lỗi do nhà sản xuất. Giá đã bao gồm VAT','','','',''),(37,59,'','','Máy in laser trắng đen đơn năng Brother HL-B2180DW','','','','','','Miễn phí vận chuyển toàn quốc Giá đã bao gồm VAT','','','',''),(38,61,'','','Máy ảnh lấy liền, lấy nét tự động','','','Kích thước 121x79.5x32.8mm, Trọng lượng 230g','',' Bluetooth 5.2','Công nghệ in chuyển nhiệt Zink In ảnh động VR thú vị Kết nối bluetooth Tự động lấy nét Bộ lọc 8 chức năng In ảnh di động.',' 300DPI','','',''),(39,62,'6.7\"','Độ phân giải camera	5MP','Điện thoại di động Realme RMX3930 - Realme C61 (4-128) - Vàng - TBH','Android 14','RAM	4GB, Bộ nhớ trong	128GB','Kích thước	167.26mm × 76.67mm × 7.84mm, Trọng lượng	188g','5000mAh','Type-C','Bảo mật sinh trắc học	Mở khóa vân tay cạnh viền, mở khóa khuôn mặt Tính năng đặc biệt	Màn hình giọt nước, màn hình 16.7 triệu màu','720 x 1600','90Hz','560nits','LCD'),(40,63,'6.67\"','Camera trước 16MP f/2.4','Điện thoại di động REDMI NOTE 13 6.67/SNAP 685/6G/128G/108M+8M UW+2M Macro/16MP/5000mAh (23129RAA4G)/VÀNG(6941812762417) - 86997 - TBH','Android 13','RAM: 6GB, Bộ nhớ trong: 128GB','Trọng lượng	188.5g, Kích thước	162.24mm x 75.55mm x 7.97mm','5000mAh','Type-C','Ứng dụng kép (Nhân bản ứng dụng) Đa cửa sổ (chia đôi màn hình) Âm thanh Dolby Atmos ','2400 x 1080','120Hz','1800nits','AMOLED'),(41,64,'6.5\"','3 camera 12 MP','Iphone 11 Pro Max 256GB Midnight Green - Chính hãng VN/A - Cũ','IOS','RAM: 4GB, Bộ nhớ trong: 256GB','Đang cập nhật','3969mAh','Lightning','Âm thanh Dolby Audio Apple Pay Đèn pin Kháng nước, kháng bụi','2688 x 1242','Đang cập nhật','Đang cập nhật','OLED'),(42,65,'6.56\"','5 MP Camera (f/2.2 aperture)','Điện thoại thông minh Honor X6b (6+128GB) Đen (Midnight Black)_JDY-LX2BLK - TBH','MagicOS 8.0 (Android 14)','RAM	6GB, Bộ nhớ trong	128GB','Kích thước	163.59mm x 75.33mm x 8.39mm, Trọng lượng	192g','5200mAh','Type-C','Công nghệ RAM mở rộng HONOR RAM Turbo','720 x 1612','90Hz','Đang cập nhật','TFT LCD'),(43,66,'7.6\" 6.2\"','Camera trước ở màn hình phụ: 10 MP Camera ẩn dưới màn hình: 4 MP','ĐTDĐ Samsung Z Fold5, SM-F946B, 512GB, Kem - TBH','Android 13','RAM	12GB; Bộ nhớ trong	512GB','Kích thước	 Khi mở: 154.9mm x 129.9mm x 6.1mm Khi gập: 154.9mm x 67.1mm x 13.4mm; Trọng lượng	253g','4400mAh','OTG Hỗ trợ NFC','Mở khoá vân tay cạnh viền Nhận diện khuôn mặt Hỗ trợ S-Pen Chạm 2 lần sáng màn hình, Âm thanh AKG','MH chính: 2176 x 1812 MH phụ: 2316 x 904','120Hz','1750nits','Dynamic AMOLED 2X'),(44,67,'6.9\"',' Camera 12MP, khẩu độ ƒ/1.9','iPhone 16 Pro Max (256GB) - Chính hãng VN/A',' iOS 18','RAM 8GB Bộ nhớ trong 256GB','Kích thước 163mm x 77.6mm x 8.25mm; Trọng lượng 227g','Loại pin Li-Ion; Hỗ trợ sạc tối đa 30W','Kết nối khác DisplayPort USB 3 (lên đến 10Gb/s) Hỗ trợ NFC',' Nút điều khiển camera: Độ Phơi Sáng, Chiều Sâu, Thu Phóng, Camera, Phong Cách, Tông • Tương Thích Với Thiết Bị Trợ Thính','2868 x 1320','10-120Hz','2000nits','Super Retina XDR'),(45,69,'6.1\"',' 48MP(ƒ/1.6) x 12MP (ƒ/1.6) x 12MP (ƒ/2.2)','iPhone 16 (256GB) - Chính hãng VN/A',' iOS 18','RAM 8GB; Bộ nhớ trong 256GB','Kích thước 147.6mm x 71.6mm x 7.80mm; Trọng lượng 170g','Loại pin Li-Ion','Cổng kết nối/sạc Type-C',' Nút điều khuyển camera • Có MagSafe • Tương Thích Với Thiết Bị Trợ Thính','2556 x 1179',' 60Hz','2000nits',' Super Retina XDR'),(46,70,'6.78\"',' Camera trước 13MP Samsung ISOCELL3L6','OSCAL TIGER 12 (8+8GB/128GB) - Chính hãng',' Android 13','Bộ nhớ trong 128GB; RAM 8GB','Kích thước 168.5mm x 76.6mm x 8.4mm; Trọng lượng 198.3g','Dung lượng pin sản phẩm 5000mAh','Cổng kết nối/sạc Type-C','Bảo mật sinh trắc học Cảm biến vân tay cạnh bên Mở khóa bằng khuôn mặt 2D','2460 x 1080','120Hz','500nits','IPS LCD'),(47,71,'6.7\"',' 8K 4320p@30fps','Samsung Galaxy S24 FE 8GB/128GB',' Android 14','RAM 8GB; Bộ nhớ trong 128 GB','Kích thước 162mm x 77.3mm x 8mm; Trọng lượng 213g','Dung lượng pin sản phẩm 4700mAh','Cổng kết nối/sạc Type-C','Bảo mật sinh trắc học Mở khoá vân tay dưới màn hình Mở khoá khuôn mặt','1080 x 2340','120Hz','1900nits','Dynamic AMOLED 2X'),(48,72,' 6.68\"','Độ phân giải camera 50 MP (f/1.8) x 0.08 MP','Vivo Y19S 8/128GB - Chính hãng','Android 14','RAM 8 GB; Bộ nhớ trong 128GB','Kích thước 165.75 mm x 76.1 mm x 8.1 mm; Trọng lượng 198g','Dung lượng pin sản phẩm 5500 mAh','Cổng kết nối/sạc Type-C','Tính năng đặc biệt Ứng dụng kép (Nhân bản ứng dụng) Âm thanh AKG Công nghệ tản nhiệt LiquidCool',' Chính 50 MP & Phụ 0.08 MP',' 90Hz','1000nits','IPS LCD'),(49,73,'6.7\"','Độ phân giải camera 48MP (ƒ/1.78) x 12MP (ƒ/2.2) x 12MP (ƒ/2.8)','Điện thoại iPhone 15 Pro Max (256GB) - Chính hãng VN/A',' iOS 17','RAM 8GB; Bộ nhớ trong 256GB','Kích thước 159.9mm x 76.7mm x 8.25mm; Trọng lượng 221g','Dung lượng pin sản phẩm 4422mAh','Cổng kết nối/sạc Type-C','Bảo mật sinh trắc học Face ID Kháng nước, kháng bụi IP68',' 2796 x 1290',' 120Hz',' 2000nits','Super Retina XDR'),(50,74,'6.77\'\'',' 8MP (f/2.0)','HONOR X7c - 8GB/256GB',' MagicOS 8.0','RAM 8GB (Ram Mở Rộng 8GB); Bộ nhớ trong 256GB','Kích thước 166,9 x 76,8 x 8,09 (Đen) 166,9 x 76,8 x 8,24 (Trắng); Trọng lượng Đen: 199g Trắng: 201g','Dung lượng pin sản phẩm 6000 mAh','Cổng kết nối/sạc Type-C','Kháng nước, kháng bụi IP64 Tính năng đặc biệt HONOR Histen Đa cửa sổ Neo điều hướng Chụp ảnh bằng cử chỉ','1610 x 720','120Hz',' 850nits',' TFT LCD'),(51,75,'6.88\"',' 13MP','Điện thoại Xiaomi Redmi 14C 4GB/128GB','Android 14','RAM 4GB; Bộ nhớ trong 128GB','Kích thước 71.88mm x 77.80mm x 8.22mm; Trọng lượng 211g','Dung lượng pin sản phẩm 5160mAh','Cổng kết nối/sạc Type-C','Bảo mật sinh trắc học Mở khoá vân tay cạnh viền Mở khoá khuôn mặt',' 640 x 720',' 60-120Hz',' 600nits',' IPS LCD'),(52,76,'6.67″','Độ phân giải camera 50MP (f/1.8) + 2MP (f/2.4)','Vivo Y100 8/256GB - Chính hãng','Funtouch OS 14','RAM 8GB; Bộ nhớ trong 256GB','Kích thước 163.17 × 75.81 × 7.79mm (Pha Lê Đen) 163.17 × 75.81 × 7.95mm (Kim Cương Xanh); Trọng lượng 186g (Pha Lê Đen) 188g (Kim Cương Xanh)','Dung lượng pin sản phẩm 5000mAh','Cổng kết nối/sạc Type-C','háng nước, kháng bụi IP54 Bảo mật sinh trắc học Vân tay dưới màn hình Tính năng đặc biệt Chứng Nhận Đạt Chuẩn Hi-Res Audio',' 2400 × 1080','120Hz',' 1800nits',' AMOLED'),(53,77,'6.56\"',' 5 MP Camera (f/2.2 aperture)','HONOR X6b 6/128GB- Chính hãng',' MagicOS 8.0 (Android 14)','RAM 6GB; Bộ nhớ trong 128GB','Kích thước 163.59mm x 75.33mm x 8.39mm; Trọng lượng 192g','Dung lượng pin sản phẩm 5200mAh','Cổng kết nối/sạc Type-C','Tính năng đặc biệt Công nghệ RAM mở rộng HONOR RAM Turbo Kháng nước, kháng bụi Đang cập nhật',' 720 x 1612',' 90Hz',' Đang cập nhật',' TFT LCD');
/*!40000 ALTER TABLE `productdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_email_key` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'tranvietduy03@gmail.com','$2b$10$q4qcTO8t4ruebYLi402.oOsykiDfw9iO54M9jQueIpVgGQYtVgKFC','2024-10-23 08:00:32.059',NULL,NULL,NULL,NULL),(4,'tvd12345@gmail.com','$2b$10$yJn7zo4uyWejbW8jhVViM.faN0AmJKvpgCqsYujQQrhpvb9JAbD3K','2024-10-23 08:04:50.733',NULL,NULL,NULL,NULL),(5,'tvd1@gmail.com','$2b$10$mjp4ZI3xCrd4caBf3Q/siOh.k4u661wCK4.xxTAvFjdP4TZo/kYvq','2024-10-23 08:08:54.911','Ngọc Thụy',22,'Nam','Trần Việt Duy'),(6,'tvd2k3@gmail.com','$2b$10$Sc.MxlPdMXvl/o/ng7hQY.MWCG/.XbKIY4ieOQ9LeJNIv2tiEDGbS','2024-10-24 01:27:29.748','Ngọc Thụy',29,'Nam','Trần Việt Duy'),(7,'duytvhe172200@fpt.edu.vn','$2b$10$xopBAs.fTKQdxqjJ4LjU6eQmEjdOZrQtLqDsRk1yeWoXBp736Cdwi','2024-10-24 01:49:06.026',NULL,NULL,NULL,NULL),(11,'tranvietduy7a3@gmail.com','$2b$10$E6Six0MywHuhJYcEMlCd5uQ408rLtg0NPAasNdLZla6h7NCvf2.kO','2024-11-04 02:32:12.798',NULL,NULL,NULL,NULL),(12,'181sweet@awgarstone.com','$2b$10$dObXysfwzEDWaOs53l0X0Ov2p2s3gFU7e5HYJJmAI43ifu9QeI1oK','2024-11-14 01:49:22.561','Ngọc Thụy',29,'Nam','Trần Việt Duy'),(13,'vietduytran03@gmail.com','$2b$10$yvuxWS54TeN8kP2tGkToqOBMqeNet/O5VqShzr3Mzl/i10UyMwNrq','2024-11-18 01:46:48.802','Ngọc Thụy',29,'Nam','Trần Việt Duy'),(14,'tvd2@gmail.com','$2b$10$F20URpkqJcOKX6Bxb8spruCAT079IalEaojZtNMJJVlnvNkmv.igG','2024-12-04 10:12:11.978','Ngọc Thụy',16,'Nam','Trần Việt Cường'),(15,'tranvietcuongas@gmail.com','$2b$10$m4nKVl7Vevu9ZWAceeYWZuK79Y81JLNSaJKqg/VWczBLwDGsLmW/u','2024-12-05 00:59:42.320','Hưng Yên',29,'Nam','Trần Việt Duy');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-06 19:56:25
