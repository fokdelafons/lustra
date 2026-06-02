const sharp = require('sharp');
const fs = require('fs');
const path = require('path');

const ROOT = path.resolve(__dirname, '..'); // web/assets
const QUALITY = 82; // good balance size/quality

async function walkAndConvert(dir) {
  const entries = fs.readdirSync(dir, { withFileTypes: true });
  for (const entry of entries) {
    const fullPath = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      // Skip node_modules, splash (already optimized), icons (small)
      if (entry.name === 'node_modules') continue;
      await walkAndConvert(fullPath);
    } else if (entry.isFile() && /\.(png|jpg|jpeg)$/i.test(entry.name)) {
      const webpPath = fullPath.replace(/\.(png|jpg|jpeg)$/i, '.webp');
      const oldSize = fs.statSync(fullPath).size;
      
      try {
        let pipeline = sharp(fullPath);
        if (entry.name.endsWith('.png')) {
          pipeline = pipeline.webp({ quality: QUALITY, lossless: false });
        } else {
          pipeline = pipeline.webp({ quality: QUALITY });
        }
        await pipeline.toFile(webpPath);
        
        const newSize = fs.statSync(webpPath).size;
        const saved = ((1 - newSize / oldSize) * 100).toFixed(1);
        console.log(`${path.relative(ROOT, fullPath)} -> ${path.basename(webpPath)} (${(oldSize/1024).toFixed(1)}KB -> ${(newSize/1024).toFixed(1)}KB, -${saved}%)`);
      } catch (err) {
        console.error(`Failed: ${fullPath}: ${err.message}`);
      }
    }
  }
}

async function main() {
  console.log('Converting web/assets/*.png to WebP...\n');
  await walkAndConvert(ROOT);
  console.log('\nDone! Original PNG/JPG files can now be deleted.');
}

main().catch(console.error);
