# CloudFront-Terraform 

I am creating a CF service with L@E and S3 through Terraform.

There will be a default behaviour in CF with a L@E that will decide which HTML page to serve.
It will has an **ordered** cache behavour to serve the style to the previous pages.
  
#### AWS S3 (Simple Storage Service)
_What do I need to know?_ What the service does: things like “buckets”, “keys” and “object”
📖 [What is Amazon S3?](https://docs.aws.amazon.com/AmazonS3/latest/dev/Welcome.html) (the main link and the first few section of “Introduction” are enough, skip the “Consistency Model” for now)
 
#### AWS Lambda
_What do I need to know?_ What problem lambdas solve, what is an “handler” or an “event”, where to read the logs from.
- 🎥 https://www.youtube.com/watch?v=eOBq__h4OJ4
- 📖 [AWS Lambda Product Overview](https://aws.amazon.com/lambda/)
- 📖 [AWS Lambda Logging with Node.js](https://docs.aws.amazon.com/en_pv/lambda/latest/dg/nodejs-prog-model-logging.html)
 
#### AWS CloudFront
_What do I need to know?_ What is a CDN, what problems it solves and AWS specific terminology like “distribution” or “origin servers”.
- 📖 [What Is Amazon CloudFront?](https:/docs.aws.amazon.com/en_pv/AmazonCloudFront/latest/DeveloperGuide/Introduction.html)   (the intro is more than fine, don’t worry about all the details)
 
#### AWS Lambda at Edge (aka L@E)
_What do I need to know?_ Where the functions run, what’s the difference between “origin request” and “viewer request”, where to read the logs from.
- 📖 [AWS Lambda at Edge Product Overview](https://aws.amazon.com/lambda/edge/)
- 📖 [Origin Request vs Viewer Requests (and responses)](https://docs.aws.amazon.com/en_pv/lambda/latest/dg/lambda-edge.html)
- 📖 [AWS L@E Logging in CloudWatch](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/lambda-cloudwatch-metrics-logging.html#lambda-cloudwatch-logs)
 
#### Terraform
_What do I need to know?_ What it is, which problems it does solve. What the command “init”, “plan” “apply” and “destroy” are for.
- 📖 https://www.thedevcoach.co.uk/the-six-fundamentals-of-terraform/ (Article from our friend Lou Bichard from the DX team)
  
  
You'll always have to use `dazn aws exec -p dazn-demo-one -- terraform command` format, which make sure we setup everything in the `dazn-demo-one` AWS account.
