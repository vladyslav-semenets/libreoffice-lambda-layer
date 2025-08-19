# LibreOffice for AWS Lambda as a layer

> 140 MB LibreOffice + required runtime libs to fit inside AWS Lambda Layer, compressed with Brotli or gzip

Based on the [serverless-libreoffice](https://github.com/vladgolubev/serverless-libreoffice) project.

## Getting Started

Click on Layers and choose "Add a layer", and "Provide a layer version ARN" and enter the following ARN.

```
arn:aws:lambda:us-east-1:764866452798:layer:libreoffice-brotli:1
```

See the table below for the list of supported regions and runtimes.

Works well with [aws-lambda-libreoffice npm package](https://github.com/shelfio/aws-lambda-libreoffice)

## What's inside this layer?

`libreoffice-brotli` layer contains `lo.tar.br` file which is [LibreOffice v6.4.0.1](https://github.com/vladgolubev/serverless-libreoffice/releases/tag/v6.4.0.1). Node.js has native Brotli unpacking support since version 10 so it's easy to unpack this file natively. Alternatively, you can use [aws-lambda-libreoffice npm package](https://github.com/shelfio/aws-lambda-libreoffice) to simplify this task.

`libreoffice-gzip` layer contains `lo.tar.gz` file which is [LibreOffice v6.4.0.1](https://github.com/vladgolubev/serverless-libreoffice/releases/tag/v6.4.0.1).

## How do I use this layer to launch LibreOffice?

If you don't use [aws-lambda-libreoffice npm package](https://github.com/shelfio/aws-lambda-libreoffice), then these steps are roughly what you need to do.

1. This layer just adds `/opt/lo.tar.br` or `/opt/lo.tar.gz` file to your Lambda runtime
2. Unpack `/opt/lo.tar.br` or `/opt/lo.tar.gz` file during Lambda execution into `/tmp` folder which has 512 MB of free space. Make sure to do this OUTSIDE function handler code.
   This is an expensive task, so better to make it once on a warm start.
3. LibreOffice binary will be located available at `/opt/libreoffice/program/soffice.bin`
4. Check out `/test/index.mjs` for CLI arguments needed to run LibreOffice to convert a `.txt` file to `.pdf` for more details

## Version ARNs

### LibreOffice v7.6.7.2 (Amazon Linux 2023)

Works with the following [AWS Lambda runtimes](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html) which run on Amazon Linux 2023:
- nodejs22.x
- nodejs20.x
- python3.13
- java21

| AWS Region     | Layer ARN (brotli)                                                                                                                                    |
|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| us-east-1      | `arn:aws:lambda:us-east-1:764866452798:layer:libreoffice-brotli:2` or <br> `arn:aws:lambda:us-east-1:764866452798:layer:libreoffice-gzip:2`           |
| eu-west-1      | `arn:aws:lambda:eu-west-1:764866452798:layer:libreoffice-brotli:2` or <br> `arn:aws:lambda:eu-west-1:764866452798:layer:libreoffice-gzip:2`           |
| eu-central-1   | `arn:aws:lambda:eu-central-1:764866452798:layer:libreoffice-brotli:2` or <br> `arn:aws:lambda:eu-central-1:764866452798:layer:libreoffice-gzip:2`     |
| us-west-2      | `arn:aws:lambda:us-west-2:764866452798:layer:libreoffice-brotli:2` or <br> `arn:aws:lambda:us-west-2:764866452798:layer:libreoffice-gzip:2`           |
| us-east-2      | `arn:aws:lambda:us-east-2:764866452798:layer:libreoffice-brotli:2` or <br> `arn:aws:lambda:us-east-2:764866452798:layer:libreoffice-gzip:2`           |
| ap-southeast-2 | `arn:aws:lambda:ap-southeast-2:764866452798:layer:libreoffice-brotli:2` or <br> `arn:aws:lambda:ap-southeast-2:764866452798:layer:libreoffice-gzip:2` |
| eu-west-2      | `arn:aws:lambda:eu-west-2:764866452798:layer:libreoffice-brotli:2` or <br> `arn:aws:lambda:eu-west-2:764866452798:layer:libreoffice-gzip:2`           |
| eu-west-3      | `arn:aws:lambda:eu-west-3:764866452798:layer:libreoffice-brotli:2` or <br> `arn:aws:lambda:eu-west-3:764866452798:layer:libreoffice-gzip:2`           |
| ap-southeast-1 | `arn:aws:lambda:ap-southeast-1:764866452798:layer:libreoffice-brotli:2` or <br> `arn:aws:lambda:ap-southeast-1:764866452798:layer:libreoffice-gzip:2` |
| ap-south-1     | `arn:aws:lambda:ap-south-1:764866452798:layer:libreoffice-brotli:2` or <br> `arn:aws:lambda:ap-south-1:764866452798:layer:libreoffice-gzip:2`         |
| ca-central-1   | `arn:aws:lambda:ca-central-1:764866452798:layer:libreoffice-brotli:2` or <br> `arn:aws:lambda:ca-central-1:764866452798:layer:libreoffice-gzip:2`     |
| sa-east-1      | `arn:aws:lambda:sa-east-1:764866452798:layer:libreoffice-brotli:2` or <br> `arn:aws:lambda:sa-east-1:764866452798:layer:libreoffice-gzip:2`           |

## License

MIT © [Shelf](https://shelf.io)
