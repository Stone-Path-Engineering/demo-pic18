# PIC18 Demo Project

Demonstration project for PIC18 microcontrollers that provides:

* Dockerfile with MPLabX and XC8 compiler
* Manual GitHub workflow to create Docker image in GitHub Packages
* Hello world firmware that blinks the built-in LED on the Curiosity Nano PIC18F57Q84 board using a timer interrupt.
* GitHub workflows to build and release firmware

The repository is designed so that the firmware can be built and tested in GitHub Actions while still allowing developers to build, edit, and debug the firmware in MPLabX.

## Table of Contents

1. [About the Project](#about-the-project)
1. [Project Status](#project-status)
1. [Getting Started](#getting-started)
    1. [Dependencies](#dependencies)
    1. [Building](#building)
    1. [Running Tests](#running-tests)
        1. [Other Tests](#other-tests)
    1. [Installation](#installation)
    1. [Usage](#usage)
1. [Release Process](#release-process)
    1. [Versioning](#versioning)
    1. [Payload](#payload)
1. [How to Get Help](#how-to-get-help)
1. [Contributing](#contributing)
1. [Further Reading](#further-reading)
1. [License](#license)
1. [Authors](#authors)
1. [Acknowledgments](#acknowledgments)

## About the Project

Here you can provide more details about the project

* What features does your project provide?
* Short motivation for the project? (Don't be too long winded)
* Links to the project site

```python
# Show some example code to describe what your project does
# Show some of your APIs
```

**[Back to top](#table-of-contents)**

## Project Status

![Build Status](https://github.com/Stone-Path-Engineering/demo-pic18/actions/workflows/build.yml/badge.svg?branch=main)

Describe the current release and any notes about the current state of the project. Examples: currently compiles on your host machine, but is not cross-compiling for ARM, APIs are not set, feature not implemented, etc.

**[Back to top](#table-of-contents)**

## Getting Started

! **TODO**

This section should provide instructions for other developers to

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Dependencies

! **TODO**

Describe what software and libraries you will need to install in order to build and use this project. Provide details on how to resolve these dependencies.

Remember: `git-lfs` is a dependency that developers will need to resolve before they can get started with a repository using LFS.

```bash
# Examples should be included
```

### Getting the Source

Include a link to your GitHub repository (you have no idea how people will find your code), and also a summary of how to clone.

This project is [hosted on GitHub](https://github.com/Stone-Path-Engineering/examples). You can clone this project directly using this command:

```bash
git clone git@github.com:Stone-Path-Engineering/examples.git
```

### Building

! **TODO**

Instructions for how to build your project

```bash
# Examples should be included
```

### Running Tests

! **TODO**

Describe how to run unit tests for your project.

```bash
# Examples should be included
```

#### Other Tests

! **TODO**

If you have formatting checks, coding style checks, or static analysis tests that must pass before changes will be considered, add a section for those and provide instructions

**[Back to top](#table-of-contents)**

## Firmware Release Process

Firmware releases are made to this project as examples to reference for your own projects only. Releases are made by adding a tag in the form `v#.#.#` to trigger the demo-pic18-release workflow.

### Versioning

This project uses [Semantic Versioning](http://semver.org/). For a list of available versions, see the [repository tag list](https://github.com/Stone-Path-Engineering/demo-pic18/tags).

**[Back to top](#table-of-contents)**

## Docker Image Release Process

Docker packages are made in this project as examples to reference for your own projects only. Docker releases are made by triggering the manual demo-pic18-dockerfile workflow.

Different versions of MPLabX, XC8, or Device Packs can be installed in an image by providing the desired versions as arguments when building the image. Multiple device packs is not supported by the current Dockerfile.

**[Back to top](#table-of-contents)**

## How to Get Help

Please review [CONTRIBUTING.md](docs/CONTRIBUTING.md) for details on our code of conduct and how to send questions.

## Contributing

We encourage public contributions! Please review [CONTRIBUTING.md](docs/CONTRIBUTING.md) for details on our code of conduct and development process.

**[Back to top](#table-of-contents)**

## Further Reading

* [Publishing Docker images to GitHub Packages](https://docs.github.com/en/actions/publishing-packages/publishing-docker-images#publishing-images-to-github-packages)
* [XC8 Compiler Users Guide](https://onlinedocs.microchip.com/pr/%20GUID-BB433107-FD4E-4D28-BB58-9D4A58955B1A-en-US-1/index.html)

**[Back to top](#table-of-contents)**

## License

Copyright (c) 2024 Stone Path Engineering LLC

This project is licensed under the MIT License - see [LICENSE](LICENSE) file for details.

**[Back to top](#table-of-contents)**

## Authors

* **[Bailey Steinfadt](https://github.com/baileysage)** - *Initial and ongoing work* - [Stone Path Engineering](https://github.com/Stone-Path-Engineering)

* **[Aaron Fontaine](https://github.com/afontaine79)** - *Consulting, review, and testing*

**[Back to top](#table-of-contents)**

## Acknowledgments

* [Microchip Example](https://github.com/microchip-pic-avr-examples/pic18f57q43-blink-with-timer-mplab-mcc) - used as a starting point for this project.
* [Alex Fabre XC8 Dockerfile](https://github.com/AlexFabre/mplabx-xc8) - used as a starting point for Dockerfile and workflows.
* [Phillip Johnston](https://github.com/phillipjohnston) - Supplied initial document templates - [Embedded Artistry](https://github.com/embeddedartistry/templates)

**[Back to top](#table-of-contents)**
