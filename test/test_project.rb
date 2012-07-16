require 'helper'

class TestProject < MiniTest::Unit::TestCase
  include DDD::Aggregates

  def test_project_without_tasks
    project_title = 'Birthday Cake'
    cake = Project.new(project_title)
    assert_equal(project_title, cake.title)
    assert_equal(0, cake.tasks.size)
  end

  def test_project_with_tasks
    project_title = 'Birthday Cake'
    cake = Project.new(project_title)

    # could also be cake.add_task(t)
    # or cake.tasks returns a TaskList which registers the task with the project when called for <<
    cake.tasks << Task.new('Buy milk')
    assert_equal(1, cake.tasks.size)
    cake.tasks << Task.new('Buy flower')
    assert_equal(2, cake.tasks.size)

    # recursive access
    assert_equal(2, cake.tasks.first.project.tasks.size)

    # let's go over board
    assert_equal(2, cake.tasks.first.project.tasks.last.project.tasks.size)
  end
end
