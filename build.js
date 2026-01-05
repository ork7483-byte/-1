const fs = require('fs');
const path = require('path');

// 1. dist 폴더 생성 (없으면 생성, 있으면 내용물은 유지/덮어쓰기)
const distDir = path.join(__dirname, 'dist');
if (!fs.existsSync(distDir)) {
    fs.mkdirSync(distDir);
}

// 2. 복사할 파일 확장자 목록
const extensionsToCopy = ['.html', '.css', '.js', '.png', '.jpg', '.jpeg', '.gif', '.svg'];

// 3. 현재 디렉토리의 파일들을 dist로 복사
fs.readdirSync(__dirname).forEach(file => {
    const ext = path.extname(file).toLowerCase();
    // 제외할 파일들 (소스 코드 관리용 스크립트 등)
    if (file === 'build.js' || file === 'package.json' || file === 'vercel.json' || file.startsWith('.')) return;

    if (extensionsToCopy.includes(ext)) {
        fs.copyFileSync(path.join(__dirname, file), path.join(distDir, file));
        console.log(`Copied: ${file}`);
    }
});

console.log('Build complete! All static files are in the dist/ folder.');
