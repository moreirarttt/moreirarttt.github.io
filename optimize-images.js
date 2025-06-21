const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

// Simpler script that doesn't require additional dependencies
// Will guide the user to install cwebp manually if needed

console.log('Starting image optimization...');

// Check if cwebp is available (part of libwebp)
try {
  execSync('cwebp -version', { stdio: 'ignore' });
  console.log('cwebp is installed, proceeding with WebP conversion');
} catch (error) {
  console.error('cwebp not found. Please install libwebp tools:');
  console.error('- For Windows: Download from https://developers.google.com/speed/webp/download');
  console.error('- For macOS: brew install webp');
  console.error('- For Ubuntu/Debian: sudo apt-get install webp');
  process.exit(1);
}

// Function to process a directory and convert images to WebP
function processDirectory(dirPath) {
  console.log(`Processing directory: ${dirPath}`);
  
  try {
    const files = fs.readdirSync(dirPath);
    
    for (const file of files) {
      const fullPath = path.join(dirPath, file);
      const stat = fs.statSync(fullPath);
      
      if (stat.isDirectory()) {
        // Recursively process subdirectories
        processDirectory(fullPath);
      } else {
        // Check if the file is an image (jpg, jpeg, png)
        const ext = path.extname(file).toLowerCase();
        if (['.jpg', '.jpeg', '.png', '.JPG', '.JPEG', '.PNG'].includes(ext)) {
          const webpPath = fullPath.replace(/\.\w+$/, '.webp');
          console.log(`Converting ${fullPath} to WebP...`);
          
          try {
            // Use cwebp command line tool with 80% quality
            execSync(`cwebp -q 80 "${fullPath}" -o "${webpPath}"`);
            console.log(`Successfully converted to: ${webpPath}`);
          } catch (error) {
            console.error(`Error converting ${fullPath}: ${error.message}`);
          }
        }
      }
    }
  } catch (error) {
    console.error(`Error processing directory ${dirPath}: ${error.message}`);
  }
}

// Process the main directories containing images
console.log('Starting image conversion process...');
[
  path.join(__dirname, 'assets'),
  path.join(__dirname, 'assets/gallery'),
  path.join(__dirname, 'assets/biography')
].forEach(dir => {
  if (fs.existsSync(dir)) {
    processDirectory(dir);
  } else {
    console.warn(`Warning: Directory does not exist: ${dir}`);
  }
});

console.log('Image optimization complete!');

console.log('\nNext Steps:');
console.log('1. Update your HTML to use <picture> elements with WebP sources');
console.log('2. Example:');
console.log(`
<picture>
  <source srcset="assets/image.webp" type="image/webp">
  <img src="assets/image.jpg" alt="Description" class="your-classes">
</picture>
`);
console.log('3. For JS-generated gallery, update the code to use WebP images with fallbacks');
