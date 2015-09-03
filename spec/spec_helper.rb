require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
RSpec.configure do |config|
  require 'pry'
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
