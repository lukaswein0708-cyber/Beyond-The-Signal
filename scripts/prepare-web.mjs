import { mkdir, copyFile } from 'node:fs/promises';

await mkdir('www', { recursive: true });
await copyFile('index.html', 'www/index.html');
await copyFile('supabase-config.js', 'www/supabase-config.js');
console.log('Web-Dateien wurden nach www/ kopiert.');
