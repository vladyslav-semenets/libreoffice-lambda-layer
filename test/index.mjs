import { writeFileSync } from 'node:fs';
import { execSync } from 'node:child_process';

const convertCommand = '/opt/libreoffice/program/soffice.bin --headless --norestore --invisible --nodefault --nofirststartwizard --nolockcheck --nologo --convert-to "pdf:writer_pdf_Export" --outdir /tmp /tmp/test.txt';

export const handler = async () => {
  try {
    writeFileSync('/tmp/test.txt', Buffer.from('Hello World!'));
    let convertResult = null;

    try {
      convertResult = execSync(convertCommand, { encoding: 'utf8' });
      console.log('Conversion output:', convertResult);
    } catch (convertError) {
      console.error('Conversion failed:', convertError.message, convertError?.stdout?.toString('utf8'), convertError?.stderr?.toString('utf8'));
    }

    return {
      statusCode: 200,
      body: JSON.stringify({
        message: 'LibreOffice conversion test completed',
        result: execSync('ls -alh /tmp', { encoding: 'utf8' }),
        convertResult,
        timestamp: new Date().toISOString()
      })
    };

  } catch (error) {
    console.error('Handler error:', error);
    return {
      statusCode: 500,
      body: JSON.stringify({
        error: error.message,
      })
    };
  }
};
