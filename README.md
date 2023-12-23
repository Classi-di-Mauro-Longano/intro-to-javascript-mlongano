# Jupyter Lab with Deno Kernel Devcontainer

[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)


This project provides a development container for working with Jupyter Lab add a Deno kernel to use Typescript in a Notebook. It allows you to create a consistent, reproducible development environment with all the necessary dependencies set up for you.

## Getting Started

To get started, you need to have Docker installed on your machine. Once Docker is installed, you can use the `Remote - Containers` extension in Visual Studio Code to open the project in the development container.

## Devcontainer Details

The development container is defined by two files: `Dockerfile` and `devcontainer.json`.

### Dockerfile

The Dockerfile defines the base image and the necessary dependencies for the project. It sets up Jupyter Lab and the Deno kernel.

#### Customizing the Docker Container Build

You can customize the build of the Docker container by setting the `JUPYTERLAB_PORT` and `NOTEBOOKS_DIR` arguments when you build the Docker image.

- JUPYTERLAB_PORT

This argument sets the port that Jupyter Lab will run on inside the Docker container. The default value is `8888`. If you want to use a different port, you can set this argument when you build the Docker image or in the `devcontainer.json` file.

- NOOTEBOOKS_DIR

This argument Specifies the directory where Jupyter Lab will look for notebooks. The default value is `/notebooks`. If you want to use a different directory, you can set this argument when you build the Docker image or in the `devcontainer.json` file.

### devcontainer.json

The `devcontainer.json` file configures how Visual Studio Code should start the container and what features should be available.

## Usage

Once you've opened the project in the development container, you can start Jupyter Lab and begin working with notebooks that use the Deno kernel.

## Contributing

Contributions are welcome! If you find a bug or want to add a feature, please open an issue or submit a pull request.

## License

This project is licensed under the terms of the MIT license:
