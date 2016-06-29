require_relative '../test_helper'

class TaskTest < Minitest::Test

  def test_assigns_attributes_correctly
    task = Task.new({"id" => "13", "title" => "dinner", "description" => "Make spaghetti"})
    assert_equal "13", task.id
    assert_equal "dinner", task.title
  end

  def test_no_title_give_mystery_title
    task = Task.new({"id" => "13", "title" => "", "description" => "Make spaghetti"})
    assert_equal "Mystery Task", task.title_check
  end

end
