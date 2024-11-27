// vercel-build.js
const { execSync } = require('child_process');

try {
  execSync('npx prisma generate', { stdio: 'inherit' });
} catch (error) {
  console.error('Error running prisma generate:', error);
  process.exit(1);
}
