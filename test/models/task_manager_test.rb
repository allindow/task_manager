require_relative "../test_helper"

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def test_total_starts_at_zero
    assert_equal 0, task_manager.all.count

    task_manager.create(title: "Plants", description: "Water them")

    assert_equal 1, task_manager.all.count
  end

  def test_it_creates_a_task
    task_manager.create(title: "Plants", description: "Water them")
    task = task_manager.find(task_manager.all.count)

    assert_instance_of Task, task
    assert_equal "Plants", task.title
    assert_equal "Water them", task.description
  end

  def test_it_collects_task_objects_with_all
   task_manager.create(title: "Plants", description: "Water them")
   task_manager.create(title: "Dinner", description: "Cook it")

   tasks = task_manager.all

   assert_instance_of Task, tasks[0]
   assert_instance_of Task, tasks[1]
  end

  def test_can_find_task_by_id
    task_manager.create(title: "Plants", description: "Water them")
    task_manager.create(title: "Dinner", description: "Cook it")

    task1 = task_manager.find(1)
    task2 = task_manager.find(2)

    assert_equal "Dinner", task2.title
    assert_equal "Water them", task1.description
  end

  def test_it_can_update_information
    task_manager.create(title: "Plants", description: "Water them")
    task_manager.create(title: "Dinner", description: "Cook it")

    edit_task = {:title => "Dinner", :description => "Cook spaghetti"}
    task_manager.update(task_manager.all.count, edit_task)
    task2 = task_manager.find(task_manager.all.count)

    assert_equal "Cook spaghetti", task2.description
  end

  def test_it_can_destroy_a_task
    task_manager.create(title: "Plants", description: "Water them")
    task_manager.create(title: "Dinner", description: "Cook it")
    assert_equal 2, task_manager.all.count
    task_manager.destroy(task_manager.all.count)
    assert_equal 1, task_manager.all.count
  end

end
