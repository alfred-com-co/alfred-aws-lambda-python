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
│       ├── black.yml
│       ├── delivery.yml
│       ├── dev-delivery.yml
│       └── prod-delivery.yml
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

This repository has GitHub Actions configuration files. When a new commit is pushed to 
the main branch, a new version of the Lambda function will automatically be deployed to 
the development environment.

> The event that fires the deployment flow is a `push`. Which means that `Pull Requests` 
> pointing to the main branch will also trigger the event.

You must configure these flows with the following command:

```bash
make lambda=<function-name> setup-deployment-flow
```

If you want to deploy a new version of the Lambda function in the production environment 
you can do it by going to the GitHub repository and within the actions tab you can 
trigger the deployment flow to production.

> For GitHub Actions flows to be able to run, you must `enable` this option in the `settings` 
> tab of your repository

## Authors ✍️

- Alfred's Tech Team
