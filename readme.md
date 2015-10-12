Codecov Bash Example
====================

| [https://codecov.io][1] | [@codecov][2] | [hello@codecov.io][3] |
| ----------------------- | ------------- | --------------------- |

> This repository serves as an example on how to integrate with Codecov for Bash/Shell language.

> See example coverage here: [![codecov.io](http://codecov.io/github/codecov/example-bash/coverage.svg?branch=master)](http://codecov.io/github/codecov/example-bash?branch=master)


# travis-ci.org

Add to your `.travis.yml` file.
```yml
language: generic

before_script:
  - pip install --user codecov && codecov
```


## Private Repos

Add to your `.travis.yml` file.
```yml
before_script:
  - pip install --user codecov && codecov -t :uuid-repo-token
```

View source and learn more about [Codecov Global Uploader][4]

[1]: https://codecov.io/
[2]: https://twitter.com/codecov
[3]: mailto:hello@codecov.io
[4]: https://github.com/codecov/codecov-python
