require 'simplecov'
require 'simplecov-cobertura'

# Configure SimpleCov to output coverage in Cobertura XML format.
# While SimpleCov's default output is HTML (useful for local viewing), .html coverage
# reports are not supported by Codecov.

# This formatter creates a `coverage/coverage.xml` file that Codecov can read.
SimpleCov.formatter = SimpleCov::Formatter::CoberturaFormatter
