# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails'
require 'pry'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)
Zonebie.set_random_timezone
Capybara.javascript_driver = :poltergeist
OmniAuth.config.test_mode = true

RSpec.configure do |config|
  config.use_transactional_fixtures = true

  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"

  RSpec.configure do |config|

    config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

    config.include RSpec::Rails::RequestExampleGroup, type: :request, example_group: {
      file_path: /spec\/acceptance\/.*_spec/
    }

    config.include Capybara::DSL, example_group: {
      file_path: /spec\/acceptance\/.*_spec/
    }

    config.include Capybara::RSpecMatchers, example_group: {
      file_path: /spec\/acceptance\/.*_spec/
    }

  end
end
