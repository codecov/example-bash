# [Codecov](https://codecov.io) Bash Example
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fcodecov%2Fexample-bash.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fcodecov%2Fexample-bash?ref=badge_shield)


## Guide

### Travis Setup

Add to your `.travis.yml` file.
```yml
language: generic

sudo: required

addons:
  apt:
    packages:
      - libcurl4-openssl-dev
      - libelf-dev
      - libdw-dev
      - cmake

after_success: |
  wget https://github.com/SimonKagstrom/kcov/archive/master.tar.gz &&
  tar xzf master.tar.gz &&
  cd kcov-master &&
  mkdir build &&
  cd build &&
  cmake .. &&
  make &&
  sudo make install &&
  cd ../.. &&
  rm -rf kcov-master &&
  mkdir -p coverage &&
  kcov coverage script.sh &&
  bash <(curl -s https://codecov.io/bash)
```
Additional apt packages are [kcov][1] build dependencies.
[Codecov][1] is integrated by the following line in `after_success:`

### Produce Coverage Reports

Run your tests with [kcov][1] in order to create the necessary coverage
reports. For example:

```
kcov output_path script.sh
```

## Caveats
### Private Repo
Repository tokens are required for (a) all private repos, (b) public repos not using Travis-CI, CircleCI or AppVeyor. Find your repository token at Codecov and provide via appending `-t <your upload token>` to you where you upload reports.

## Links
- [Community Boards](https://community.codecov.io)
- [Support](https://codecov.io/support)
- [Documentation](https://docs.codecov.io)

[1]: https://simonkagstrom.github.io/kcov


## License
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fcodecov%2Fexample-bash.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Fcodecov%2Fexample-bash?ref=badge_large)