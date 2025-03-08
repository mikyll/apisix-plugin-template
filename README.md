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
  - [Testing](#testing)
    - [Docker](#docker)
    - [CI](#ci)
  - [Examples](#examples)
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
├── examples         APISIX examples and use cases
├── t/               Test cases go here
├── LICENSE
├── Makefile
└── README.md
```

[Back to TOC](#table-of-contents)

## Plugin Usage

TODO

[Back to TOC](#table-of-contents)

## Testing

To test your custom plugin, you can [write tests](https://apisix.apache.org/docs/apisix/internal/testing-framework) for it and run these tests in a Docker container locally or in the CI.

### Docker

TODO

### CI

The [`ci.yml`](.github/workflows/ci.yml) workflow runs the tests cases in the [`t/`](t/) folder on **pull_request** and **workflow_dispatch** events.

[Back to TOC](#table-of-contents)

## Examples

Folder [`examples/`](examples/) cotains examples to setup APISIX in Docker and Kubernetes, with different kind of deployments.

## Learn More

- [APISIX Source Code](https://github.com/apache/apisix)
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
