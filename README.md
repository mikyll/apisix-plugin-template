<div align="center">

[![APISIX][apisix-shield]][apisix-url]
[![NGINX][nginx-shield]][nginx-url]
[![Lua][lua-shield]][lua-url]
[![Perl][perl-shield]][perl-url]
[![YAML][yaml-shield]][yaml-url]\
[![Build Status](https://github.com/mikyll/apisix-plugin-template/actions/workflows/ci.yml/badge.svg)](https://github.com/mikyll/apisix-plugin-template/actions)

# APISIX Plugin Template

This template can be used to create custom Lua plugins for [Apache APISIX](https://github.com/apache/apisix).

</div>

## Table of Contents

- [APISIX Plugin Template](#apisix-plugin-template)
- [Table of Contents](#table-of-contents)
- [Usage](#usage)
- [Plugin Template Structure](#plugin-template-structure)
- [Testing](#testing)
- [Learn More](#learn-more)

## Usage

You can use this template by clicking the "[Use this template](https://github.com/api7/apisix-plugin-template/generate)" button on the top.

You can then clone the newly generated repository to your local machine and write your custom code.

[Back to TOC](#table-of-contents)

## Plugin Template Structure

The template contains the following files:

```shell
.
├── .github/         GitHub Actions workflows and Dependabot configuration files
├── apisix           All files in this folder will be copied and will overwrite the original APISIX files
│   └── plugins/     Your custom plugin goes here
├── ci               All files in this folder will be copied and will overwrite the original APISIX
│   └── utils/       CI utils script folder
├── t/               Test cases go here
├── LICENSE
├── Makefile
└── README.md
```

[Back to TOC](#table-of-contents)

## Testing

To test your custom plugin, you can [write tests](https://apisix.apache.org/docs/apisix/internal/testing-framework) for it and run these tests in the CI.

The [ci.yml](.github/workflows/ci.yml) workflow runs the tests cases in the t folder on push and pull_request events.

[Back to TOC](#table-of-contents)

## Learn More

- [APISIX testing framework](https://apisix.apache.org/docs/apisix/internal/testing-framework)
- [Developing custom APISIX plugins](https://apisix.apache.org/docs/apisix/plugin-develop)
- [APISIX debug mode](https://apisix.apache.org/docs/apisix/architecture-design/debug-mode)
- [APISIX code style](https://github.com/apache/apisix/blob/master/CODE_STYLE.md)

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
