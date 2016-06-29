require_relative "../test_helper"

class UserSeesTasksTest < FeatureTest
#we defined FeatureTest in testhelper. it is a class we created which inherits from Minitest and includes the capybara dsl module
  def test_user_sees_index_of_tasks
    task1 = task_manager.create({:title => "Dog", :description => "Take Spot to the park"})
    task2 = task_manager.create({:title => "Capybara", :description => "Swim in hottub to James Brown"})
    # As a user,
    # When I visit the tasks index
    visit "/tasks"
    # Then I see a list of all tasks displayed only by their titles
    # assert page.has_content?("Dog")
    # assert page.has_content?("Capybara")
    #now let's scope down with within.......
    within("#task_list") do
      assert page.has_content?("Dog")
      assert page.has_content?("Capybara")
    end
  end


end
