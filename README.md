# [Codecov][1] Bash Example
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
Additional apt packages are [kcov][2] build dependencies.
[Codecov][1] is integrated by the following line in `after_success:`
### Produce Coverage Reports

Run your tests with [kcov][2] in order to create the necessary coverage
reports. For example:

```
kcov output_path script.sh
```
## Caveats
### Private Repos
Add to your `.travis.yml` file.
```yml
after_success:
  - bash <(curl -s https://codecov.io/bash) -t uuid-repo-token
```
## Support

### Contact
- Intercom (in-app messanger)
- Email: [support@codecov.io](mailto:support@codecov.io)
- Slack: [slack.codecov.io](https://slack.codecov.io)
- [gh/codecov/support](https://github.com/codecov/support)

1. More documentation at https://docs.codecov.io
2. Configure codecov through the `codecov.yml`  https://docs.codecov.io/docs/codecov-yaml



[1]: https://codecov.io/
[2]: https://simonkagstrom.github.io/kcov
