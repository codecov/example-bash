Codecov Bash Example
====================

| [https://codecov.io][1] | [@codecov][2] | [hello@codecov.io][3] |
| ----------------------- | ------------- | --------------------- |

This repository serves as an example on how to integrate with Codecov for Bash/Shell language.

See example coverage here: [![codecov.io](http://codecov.io/github/codecov/example-bash/coverage.svg?branch=master)](http://codecov.io/github/codecov/example-bash?branch=master)

## Basic Usage

Run your tests with [kcov][5] in order to create the necessary coverage
reports. For example:

```
kcov output_path script.sh
```

## travis-ci.org

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
Additional apt packages are [kcov][5] build dependencies.
[Codecov][1] is integrated by the following line in `after_success:`

```yml
bash <(curl -s https://codecov.io/bash)
```

## Private Repos

Add to your `.travis.yml` file.

```yml
env:
  global:
    - CODECOV_TOKEN=:uuid-repo-token
```

View source and learn more about [Codecov Global Uploader][4]

We are happy to help if you have any questions. Please contact email our Support at [support@codecov.io](mailto:support@codecov.io)

[1]: https://codecov.io/
[2]: https://twitter.com/codecov
[3]: mailto:hello@codecov.io
[4]: https://github.com/codecov/codecov-python
[5]: https://simonkagstrom.github.io/kcov
