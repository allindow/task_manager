require_relative "../test_helper"

class UserCanCreateATaskTest < FeatureTest

  def test_user_can_create_a_task
     #     As a user,
    # When I visit the dashboard
    visit "/"
    # And I click "New Task" button
    click_link "New Task"
    # Then I should be on the new task page
       #make an assertion that you're on the right page at this point
    assert_equal "/tasks/new", current_path
    # and I fill in title field with "new task title"
    fill_in "task[title]", with: "new task title"
    # and I fill in the description field with "new task description",
    fill_in "task[description]", with: "new task description"
    # and I click on submit button
    click_button "Submit"
    assert_equal "/tasks", current_path
    # Then I see a list of all tasks and an All Tasks Header
    assert page.has_css?("#title")
    assert page.has_content?("All Tasks")
  end

end
