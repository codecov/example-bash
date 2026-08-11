# [Codecov](https://codecov.io) Bash Example

[![codecov](https://codecov.io/gh/codecov/example-bash/branch/master/graph/badge.svg)](https://codecov.io/gh/codecov/example-bash)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fcodecov%2Fexample-bash.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fcodecov%2Fexample-bash?ref=badge_shield)

This repository demonstrates how to collect and report code coverage for Bash scripts using [Codecov](https://codecov.io). It provides a complete, working example that you can use as a template for your own projects.

## Quick Start

1. **Copy the key files** to your repository:
   - [`.github/workflows/ci.yml`](.github/workflows/ci.yml) - GitHub Actions workflow for running coverage
   - [`.simplecov`](.simplecov) - SimpleCov configuration for XML output
   - `Gemfile` - Ruby dependencies

2. **Install dependencies**:

   ```bash
   bundle install
   ```

3. **Run coverage locally**:

   ```bash
   bashcov script.sh
   ```

4. **View the coverage report**:
   - HTML report: `coverage/index.html`
   - XML report (for Codecov): `coverage/coverage.xml`

5. **Set up GitHub Actions**:
   - The workflow will automatically run on push
   - For private repos, add `CODECOV_TOKEN` as a repository secret

## How It Works

This setup uses a combination of Ruby tools to instrument and collect coverage from Bash scripts:

1. **`bashcov`** runs your Bash script with coverage instrumentation, tracking which lines are executed
2. **`simplecov-cobertura`** converts the coverage data into Cobertura XML format
3. **Codecov Action** uploads the XML report to Codecov for visualization and tracking

The default SimpleCov output is HTML, which Codecov cannot process. That's why we use `simplecov-cobertura` to generate XML format that Codecov understands.

## Key Files

### [`.github/workflows/ci.yml`](.github/workflows/ci.yml)

This GitHub Actions workflow:

- Checks out your code (with `fetch-depth: 2` for proper commit detection)
- Sets up Ruby and installs dependencies
- Runs your script with `bashcov` to collect coverage
- Uploads the coverage report to Codecov

See the workflow file for detailed inline comments explaining each step.

### [`.simplecov`](.simplecov)

This configuration file tells SimpleCov to output coverage in Cobertura XML format instead of the default HTML. Codecov requires XML format to process coverage reports.

## Dependencies

This project uses two Ruby gems:

- **`bashcov`**: A coverage tool for Bash scripts. It instruments your script and tracks which lines are executed during runtime. Learn more at [bashcov on GitHub](https://github.com/infertux/bashcov).

- **`simplecov-cobertura`**: A formatter for SimpleCov that outputs coverage reports in Cobertura XML format. While SimpleCov's default output is HTML (great for local viewing), Codecov requires XML format to ingest coverage data. This gem bridges that gap.

## Example Script

The included [`script.sh`](script.sh) demonstrates a simple Bash script with:

- Function definitions
- Conditional logic
- Multiple execution paths

When run with `bashcov`, it shows which code paths are executed and which are not, helping you identify untested code.

## Private Repositories

Repository tokens are required for:

- All private repositories
- Public repositories not using GitHub Actions, Travis-CI, CircleCI, or AppVeyor

To use a token:

1. Find your repository token at [Codecov](https://codecov.io)
2. Add it as a GitHub secret named `CODECOV_TOKEN` (or `CODECOV_ORG_TOKEN` for organization-level tokens)
3. The workflow will automatically use it

## Documentation

- **[Codecov Bash Documentation](https://about.codecov.io/language/bash/)** - Official guide for Bash coverage
- **[codecov-action Repository](https://github.com/codecov/codecov-action)** - GitHub Action for uploading coverage
- **[Codecov Documentation](https://docs.codecov.io)** - Complete Codecov documentation
- **[How to get Coverage Metrics for Bash Scripts](https://about.codecov.io/blog/how-to-get-coverage-metrics-for-bash-scripts/)** - Blog post with detailed instructions

## Support

- [Community Boards](https://community.codecov.io)
- [Support](https://codecov.io/support)
- [Documentation](https://docs.codecov.io)

## License

[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fcodecov%2Fexample-bash.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Fcodecov%2Fexample-bash?ref=badge_large)
