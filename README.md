# PIC18 Demo Project <!-- omit from toc -->

![Build Status](https://github.com/Stone-Path-Engineering/demo-pic18/actions/workflows/build.yml/badge.svg?branch=main)

Demonstration project for PIC18 microcontrollers that provides:

* Dockerfile with MPLabX and XC8 compiler
* Manual GitHub workflow to create Docker image in GitHub Packages
* Hello world firmware that blinks the built-in LED on the Curiosity Nano PIC18F57Q84 board using a timer interrupt.
* GitHub workflows to build and release firmware

The repository is designed so that the firmware can be built and tested in GitHub Actions while still allowing developers to build, edit, and debug the firmware in MPLabX.

## Table of Contents

1. [Project Status](#project-status)
1. [Getting Started](#getting-started)
    1. [Dependencies](#dependencies)
    1. [Building](#building)
    1. [Running Tests](#running-tests)
1. [Firmware Release Process](#firmware-release-process)
    1. [Versioning](#versioning)
1. [Docker Image Release Process](#docker-image-release-process)
1. [How to Get Help](#how-to-get-help)
1. [Contributing](#contributing)
1. [Further Reading](#further-reading)
1. [License](#license)
1. [Authors](#authors)
1. [Acknowledgments](#acknowledgments)

## Project Status

While this project should work on any computer that can install MPLabX or Docker, it has been tested in GitHub Actions, natively on Windows with MPLabX 6.20, and in Docker running on Windows with no native MPLabX installation.

Similarly, while the project materials should be easily adaptable to any MCU that is supported by the Microchip XC8 compiler, it has only been tested using the PIC18F57Q84.

The provided materials should allow developers to use the provided Dockerfile to create a devcontainer in order to develop firmware in VSCode or other IDEs. However, this use case is not covered in documentation nor example files at this time.

Roadmap for improvements and features can be found in the [Issue Tracker](https://github.com/Stone-Path-Engineering/demo-pic18/issues). Unassigned issues are [open for contribution](#contributing).

**[Back to top](#table-of-contents)**

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Dependencies

To use this demo project locally, you will need to install either [MPLabX IDE](https://www.microchip.com/en-us/tools-resources/develop/mplab-x-ide) with the XC8 compiler, or [Docker](https://docs.docker.com/get-docker/).

If you are using both, for exapmle, the IDE locally and Docker on GitHub Actions, ensure that the IDE and compiler versions you are using to build your Docker image match what you installed locally. The IDE will help you download the correct device pack, but if you change it, ensure that it matches in both environments as well.

### Getting the Source

This project is [hosted on GitHub](https://github.com/Stone-Path-Engineering/demo-pic18). You can clone this project directly using this command:

```bash
git clone https://github.com/Stone-Path-Engineering/demo-pic18.git
```

### Building

If using the IDE, build using the tools included in the toolbars of the IDE. Note which configuration is active when you build and whether you're building via the `Production` menu or the `Debug` ones. The GitHub Actions workflows build a production build using the release configuration, but can be edited to build with debug options or a different configuration.

When using the command line, you must first generate the makefiles for the Microchip generated components specified in your project and configuration files.

```bash
prjMakefilesGenerator.sh timer-blink.X
```

Then, you can build using make. The `CONF` option specifies which configuration will build, and the `-mdfp` flag will be passed into the compiler to specify which device pack you are using.

```bash
make -C timer-blink.X CONF=release build CFLAGS="-mdfp=/opt/mplabx/packs/Microchip/$PACK_FAMILY/$PACK_VERSION"
```

Condensing this into a single build script is on the roadmap.

### Running Tests

TBD.

Getting CppCheck and unit tests running on this project is on the near term roadmap.

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
