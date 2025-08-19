#!/bin/bash

echo "🏗️ Building image..."

docker build -t lo-lambda-layer -f Dockerfile.lambda .

echo "🚀 Starting container..."

docker run --platform=linux/amd64 --rm -d -it --name lo-lambda-layer -p 9000:8080 lo-lambda-layer

sleep 5

FIRST_RESPONSE=$(curl -s -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" \
  -d '{}' > /dev/null)

echo "🔄 Testing..."
SECOND_RESPONSE=$(curl -s -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" \
  -d '{}')

EXPECTED_TEXT="convert /tmp/test.txt as a Writer document -> /tmp/test.pdf using filter : writer_pdf_Export"

if echo "$SECOND_RESPONSE" | grep -q "$EXPECTED_TEXT"; then
    echo "✅ Lambda function is working correctly"
    EXIT_CODE=0
else
    echo "❌ Lambda function is not working as expected"
    echo "Expected text not found in response:"
    echo "Expected: $EXPECTED_TEXT"
    echo "Actual response: $SECOND_RESPONSE"
    EXIT_CODE=1
fi

docker stop lo-lambda-layer

exit $EXIT_CODE
