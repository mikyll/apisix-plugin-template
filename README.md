<div align="center">

[![APISIX][apisix-shield]][apisix-url]
[![NGINX][nginx-shield]][nginx-url]
[![Lua][lua-shield]][lua-url]
[![Perl][perl-shield]][perl-url]
[![YAML][yaml-shield]][yaml-url]\
[![Build Status][build-status-shield]][build-status-url]

# APISIX Plugin Template

This template can be used to create custom Lua plugins for [Apache APISIX](https://github.com/apache/apisix).<br>
Extended from [api7/apisix-plugin-template](https://github.com/api7/apisix-plugin-template).

</div>

## Table of Contents

- [APISIX Plugin Template](#apisix-plugin-template)
  - [Table of Contents](#table-of-contents)
  - [Template Usage](#template-usage)
  - [Plugin Template Structure](#plugin-template-structure)
  - [Plugin Usage](#plugin-usage)
    - [Installation](#installation)
  - [Testing](#testing)
    - [Local Docker](#local-docker)
    - [CI](#ci)
  - [Examples](#examples)
    - [Docker](#docker)
      - [Standalone](#standalone)
      - [Traditional](#traditional)
      - [Custom Image](#custom-image)
    - [Kubernetes (Helm Chart)](#kubernetes-helm-chart)
      - [apisix/apisix](#apisixapisix)
      - [bitnami/apisix](#bitnamiapisix)
  - [Learn More](#learn-more)

## Template Usage

You can use this template by clicking the "[Use this template](https://github.com/api7/apisix-plugin-template/generate)" button on the top.

You can then clone the newly generated repository to your local machine and write your custom code.

[Back to TOC](#table-of-contents)

## Plugin Template Structure

The template contains the following files:

```lang-none
.
├── .github/         GitHub Actions workflows and Dependabot configuration files
├── apisix           All files in this folder will be copied and will overwrite the original APISIX files
│   └── plugins/     Your custom plugin goes here
├── ci               All files in this folder will be copied and will overwrite the original APISIX
│   └── utils/       CI utils script folder
├── examples/        APISIX examples and use cases
├── t/               Test cases
├── LICENSE
├── Makefile
└── README.md
```

[Back to TOC](#table-of-contents)

## Plugin Usage

### Installation

To install the plugin in APISIX there are 2 methods:

- placing them alongside other built-in plugins, in `${APISIX_INSTALL_DIRECTORY}/apisix/plugins/` (by default `/usr/local/apisix/apisix/plugins/`);
- placing them in a custom directory and setting `apisix.extra_lua_path` to point that directory, in `config.yaml`.

[Back to TOC](#table-of-contents)

## Testing

To test your custom plugin, you can:

- enable it on a route or a global rule and try sending a request;
- [write tests](https://apisix.apache.org/docs/apisix/internal/testing-framework) for it and run these tests in a Docker container locally or in the CI.

### Local Docker

This repository contains a [Docker image](examples/apisix-docker-custom/Dockerfile) which builds APISIX from source and installs the NGiNX testing framework. This can be used to run tests locally.

### CI

The [`ci.yml`](.github/workflows/ci.yml) workflow runs the tests cases in the [`t/`](t/) folder and can be triggered by a **workflow_dispatch** event, from GitHub: [Actions | CI](https://github.com/mikyll/apisix-plugin-template/actions/workflows/ci.yml).

[Back to TOC](#table-of-contents)

## Examples

Folder [`examples/`](examples/) contains several examples to setup APISIX and load the plugin(s), in different deployment modes, for Docker and Kubernetes installations.

### Docker

The following examples show how to install APISIX in a Docker container.

#### Standalone

Folder: [`examples/apisix-docker-standalone/`](examples/apisix-docker-standalone/)

Standalone Moded uses a s

#### Traditional

Folder: [`examples/apisix-docker-traditional/`](examples/apisix-docker-traditional/)

In traditional deployment mode, there's one single instance of APISIX which acts as both the **data plane** (i.e. the actual API gateway, which processes requests) and the **control plane** (i.e. the configuration manager).

#### Custom Image

Folder: [`examples/apisix-docker-custom/`](examples/apisix-docker-custom/)

### Kubernetes (Helm Chart)

The following examples show how to install APISIX in a Kubernetes cluster, using Helm. To run locally, have a look at [minikube](https://minikube.sigs.k8s.io/) or [k3s](https://k3s.io/).

#### apisix/apisix

Folder: [`examples/apisix-k8s-helm-apisix/`](examples/apisix-k8s-helm-apisix/)

#### bitnami/apisix

Folder: [`examples/apisix-k8s-helm-bitnami/`](examples/apisix-k8s-helm-bitnami/)

[Back to TOC](#table-of-contents)

## Learn More

- [APISIX Source Code](https://github.com/apache/apisix)
- [APISIX Deployment Modes](https://apisix.apache.org/docs/apisix/deployment-modes/)
- [Developing custom APISIX plugins](https://apisix.apache.org/docs/apisix/plugin-develop)
- [APISIX testing framework](https://apisix.apache.org/docs/apisix/internal/testing-framework)
- [APISIX debug mode](https://apisix.apache.org/docs/apisix/debug-mode/)
- [NGiNX variables](https://nginx.org/en/docs/http/ngx_http_core_module.html#variables)

<!-- GitHub Shields -->

[apisix-shield]: https://custom-icon-badges.demolab.com/badge/APISIX-grey.svg?logo=apisix_logo
[apisix-url]: https://apisix.apache.org/
[nginx-shield]: https://img.shields.io/badge/Nginx-%23009639.svg?logo=nginx
[nginx-url]: https://nginx.org/en/
[lua-shield]: https://img.shields.io/badge/Lua-%232C2D72.svg?logo=lua&logoColor=white
[lua-url]: https://www.lua.org/
[perl-shield]: https://img.shields.io/badge/Perl-%2339457E.svg?logo=perl&logoColor=white
[perl-url]: https://www.perl.org/
[yaml-shield]: https://img.shields.io/badge/YAML-%23ffffff.svg?logo=yaml&logoColor=151515
[yaml-url]: https://yaml.org/
[build-status-shield]: https://github.com/mikyll/apisix-plugin-template/actions/workflows/ci.yml/badge.svg
[build-status-url]: https://github.com/mikyll/apisix-plugin-template/actions
