// vercel-build.js
const { execSync } = require('child_process');

console.log('Running prisma generate...');

try {
  execSync('npx prisma generate', { stdio: 'inherit' });
  console.log('Prisma generate completed successfully');
} catch (error) {
  console.error('Error running prisma generate:', error.message);
  process.exit(1);
}
