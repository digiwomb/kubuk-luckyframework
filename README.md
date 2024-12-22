# KUbuK for Lucky framework

[![Version](https://img.shields.io/github/tag/digiwomb/kubuk-luckyframework.svg?maxAge=360&label=version)](https://github.com/digiwomb/kubuk-luckyframework/releases/latest)
[![License](https://img.shields.io/github/license/digiwomb/kubuk-luckyframework.svg)](https://github.com/digiwomb/kubuk-luckyframework/blob/main/LICENSE)
[![GitHub Issues or Pull Requests](https://img.shields.io/github/issues-pr/digiwomb/kubuk-luckyframework)](https://github.com/digiwomb/kubuk-luckyframework)
![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/digiwomb/kubuk/docker_build_push.yaml)
[![Docker Image Version](https://img.shields.io/docker/v/digiwomb/kubuk-luckyframework)](https://hub.docker.com/r/digiwomb/kubuk-luckyframework)


KUbuK stands for **K**asm **Ubu**ntu with **K**DE. This setup combines the Kasm workspaces environment, an Ubuntu operating system, and the KDE desktop environment, offering a flexible and user-friendly interface tailored for diverse needs.

This Docker image is fully optimized for use with **Kasm Workspaces**. It is designed for developers working with the Lucky framework.

## Base Image

This container builds on the foundation of [digiwomb/kubuk](https://github.com/digiwomb/kubuk), which comes pre-configured with:

- Essential development tools
- System libraries for modern applications
- Common utilities and dependencies to streamline container usage

## Configuration recommendation

I recommend copying the "Ubuntu KDE" workspace from https://kasmregistry.linuxserver.io and then entering digiwomb/kubuk:latest as the Docker image. I would also add the following file mapping config.

| Field | Value |
|----------|----------|
| Type    | Text   |
| Name    | kasm_post_run_user.sh   |
| Description    | kasm_post_run_user.sh  |
| Destination Path | /dockerstartup/kasm_post_run_user.sh |
| Executable | yes |
| Writable | no|

    #!/usr/bin/env bash

    # delete abandoned chromium sessions
    rm -rf ~/.config/chromium/Singleton*

    # create path to brew command
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/kasm-user/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

This will delete any active Chromium sessions before the desktop is started. These sessions can remain because Chromium is not completely terminated when the desktop is destroyed.

## Included Software

This container includes the following software, ensuring that your development environment is ready to use right out of the box:

### Core Dependencies

- **Crystal**: The language behind Lucky.
- **Lucky Framework dependencies**: All libraries and tools required to run Lucky applications.
- **Lucky CLI**: Command-line interface for managing Lucky projects.
- **PostgreSQL**: A powerful open-source relational database system.
- **Beekeeper Studio**: A administration and development platform for PostgreSQL.
- **Mailpit**: A tool for capturing and testing email sent by your application.

### VSCode Extensions

To further streamline your workflow, this container also includes support for these VSCode extensions:

- [crystal-lang](https://marketplace.visualstudio.com/items?itemName=crystal-lang): Language support for Crystal in Visual Studio Code.
- [stephendolan.lucky](https://marketplace.visualstudio.com/items?itemName=stephendolan.lucky): Lucky framework support for Visual Studio Code.

## Purpose

The primary goal of this Docker image is to provide Lucky framework developers with a fully-featured and ready-to-use development environment. By including essential dependencies and tools, this image eliminates the need for extensive setup, allowing developers to focus on building and testing their applications.


---