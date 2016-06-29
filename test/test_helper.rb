ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)

require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/dsl'
require 'launchy'

module TestHelpers
  def task_manager
    database = YAML::Store.new('db/task_manager_test')
    @database ||= TaskManager.new(database)
  end

  def teardown
    task_manager.delete_all
    super
  end
end

Capybara.app = TaskManagerApp
#tells capybara which app we are testing

class FeatureTest < Minitest::Test
  include Capybara::DSL
  #provides the capybara methods
  include TestHelpers
  #now can access task_manager in FeatureTest
end
