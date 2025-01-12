# Encoding: utf-8

require 'webmock/rspec'
require 'simplecov'
require 'factory_girl'
require 'qubell_api'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
  config.include WebMock::API
  config.include FactoryGirl::Syntax::Methods
  config.before(:all) do
    FactoryGirl.definition_file_paths = [
      File.expand_path('../factories', __FILE__)
    ]
    FactoryGirl.reload
  end
  config.before(:suite) do
    FactoryGirl.lint
  end
end

SimpleCov.start do
  add_group 'Libraries', 'lib/*'
end
