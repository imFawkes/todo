require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "should validate task w/ content" do
    assert tasks(:task_w_content_filled).valid?
  end

  test "should not validate task w/o content" do
    assert_not tasks(:task_w_content_not_filled).valid?
  end

  test "should create task if have user" do
    user = users(:user_for_tasks)
    task = tasks(:task_w_content_not_filled)
    
    user.tasks << task

    assert_includes user.tasks, task
  end
end
