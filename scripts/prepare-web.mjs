import { mkdir, readFile, writeFile, copyFile } from 'node:fs/promises';
import { gunzipSync } from 'node:zlib';

const packed = (await readFile('source/index.html.gz.b64', 'utf8')).trim();
const html = gunzipSync(Buffer.from(packed, 'base64'));
await writeFile('index.html', html);

await mkdir('www', { recursive: true });
await copyFile('index.html', 'www/index.html');
await copyFile('supabase-config.js', 'www/supabase-config.js');
console.log('Spiel und Web-Dateien wurden nach www/ vorbereitet.');
