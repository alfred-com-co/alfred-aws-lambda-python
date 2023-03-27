# Alfred AWS Lambda Python

Template repository documentation for serverless projects with AWS Lambda in Python. 
Use this template for any serverless project on AWS Lambda

<p align="center">
  <a href="https://skillicons.dev">
    <img src="https://skillicons.dev/icons?i=aws,docker,githubactions,py,md" />
  </a>
</p>

## Directory tree 🌲

```
.
├── .github
│   └── workflows
│       └── black.yml
├── htmlcov
│   └── .keep
├── src
│   ├── __init__.py
│   └── lambda_function.py
├── tests
│   └── __init__.py
├── .coveragerc
├── .dockerignore
├── .editorconfig
├── .gitignore
├── Dockerfile
├── Dockerfile-local
├── Makefile
├── README.md
├── docker-compose.yml
├── example.env
├── requirements.txt
└── requirements-test.txt
```

## Summary 📚

### Considerations 📋

### Cloud services ☁️

## How to test 🧪

Before launching the project you must create your environment variables file (.env).

### Using docker 🐳

The project use docker, so just run:

```bash
docker compose up
```

### Makefile 🎮

Makefiles are used to help decide which parts of a large program need to be recompiled. 
The project has a Makefile with abbreviations for useful project commands, if you have 
**make** installed you can use it.

|     Command     | Purpose                                                                                                                                        |
|:---------------:|------------------------------------------------------------------------------------------------------------------------------------------------|
| build-and-start | Build the image with which the container is created based on the Dockerfile and upload a container with the project's source code ready to run |
|      start      | Start the stopped container                                                                                                                    |
|      clean      | Stop and delete the running containers along with the resources created for the service (volumes, networks, etc)                               |
|      bash       | Start an interactive container terminal (bash)                                                                                                 |
|      test       | Run the unit tests                                                                                                                             |
| test-and-report | Run the unit tests and generate a coverage report                                                                                              |
| coverage-report | Generate a coverage report                                                                                                                     |
|  coverage-html  | Generate a coverage report in html files                                                                                                       |                                                                                            |

> Remember that to run the above commands you must use the `make` binary

## How to deploy 🚀

This repository has GitHub actions configuration files. When a new commit is pushed to 
the main branch, a new version of the Lambda function will automatically be deployed to 
the development environment.

> The event that fires the deployment flow is a `push`. Which means that `Pull Requests` 
> pointing to the main branch will also trigger the event.

If you want to deploy a new version of the Lambda function in the production environment 
you can do it by going to the GitHub repository and within the actions tab you can 
trigger the deployment flow to production.

### Manually

#### Source code as a zip file 📦

Your AWS Lambda function's code consists of scripts or compiled programs and their 
dependencies. You use a deployment package to deploy your function code to Lambda. 
Lambda supports two types of deployment packages: container images and `.zip` file 
archives.

To create the deployment package for a `.zip` file archive, you can use a built-in 
`.zip` file archive utility or any other `.zip` file utility (such as 7zip) for your 
command line tool. Note the following requirements for using a `.zip` file as your 
deployment package:

- The `.zip` file contains your function's code and any dependencies used to run your 
function's code (if applicable) on Lambda. If your function depends only on standard 
libraries, or AWS SDK libraries, you don't need to include these libraries in your 
`.zip` file. These libraries are included with the supported Lambda runtime environments.

- If the `.zip` file is larger than 50 MB, we recommend uploading it to your function 
from an Amazon Simple Storage Service (Amazon S3) bucket.

- You need to build the deployment package to be compatible with this instruction set 
architecture of the function.

- Lambda uses POSIX file permissions, so you may need to set permissions for the 
deployment package folder before you create the .zip file archive.

You can integrate some `GitHub` actions flows that are responsible for deploying the `.zip` 
file and creating a new version of the lambda with the file content:

```bash
git merge origin/zip_deploy
```

#### Docker image based Lambda function 🐋

You can push your container images to an [Amazon ECR](https://docs.aws.amazon.com/ecr/?id=docs_gateway) 
repository with the `docker push` command. To push a Docker image to an Amazon ECR
repository, the Amazon ECR repository must exist before you push the image.

1. Authenticate your Docker client to the Amazon ECR registry to which you intend to 
push your image. Authentication tokens must be obtained for each registry used, and the 
tokens are valid for 12 hours:

```shell
aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.<region>.amazonaws.com
```

2. Tag your image with the Amazon ECR registry, repository, and optional image tag 
name combination to use. The registry format is `<aws_account_id>.dkr.ecr.<region>.amazonaws.com`. 
The repository name should match the repository that you created for your image. If you 
omit the image tag, we assume that the tag is latest:

```shell
docker tag e9ae3c220b23 <aws_account_id>.dkr.ecr.<region>.amazonaws.com/<my-repository>:<tag>
```

3. Push the image using the `docker push` command:

```shell
docker push <aws_account_id>.dkr.ecr.<region>.amazonaws.com/<my-repository>:<tag>
```

4. [Create](https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-images.html#configuration-images-create) 
the Lambda function or update the function code to deploy the image to an existing function.

You can integrate some `GitHub` actions flows that are responsible for deploying the 
docker image and creating a new version of the lambda with the file content:

```bash
git merge origin/docker_deploy
```

## Authors ✍️

- Alfred's Tech Team
