require 'simplecov'
require 'simplecov-console'
require 'database_cleaner'
#allowing travis to run

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
 SimpleCov::Formatter::Console,
 SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
DatabaseCleaner[:active_record].strategy = :truncation

RSpec.configure do |config|
  
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
