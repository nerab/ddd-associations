require 'helper'

class TestProject < MiniTest::Unit::TestCase
  include DDD::Associations

  def test_project_without_tasks
    project_title = 'Birthday Cake'
    cake = Project.new(project_title)
    assert_equal(project_title, cake.title)
    assert(cake.tasks)
    assert_equal(0, cake.tasks.size)
  end

  def test_project_with_tasks
    project_title = 'Birthday Cake'
    cake = Project.new(project_title)

    cake.tasks << Task.new('Buy milk')
    assert_equal(1, cake.tasks.size)

    cake.tasks << Task.new('Buy flower')
    assert_equal(2, cake.tasks.size)

    # recursive access
    assert_equal(2, cake.tasks.first.project.tasks.size)

    # let's go over board
    assert_equal(2, cake.tasks.first.project.tasks.first.project.tasks.size)
  end

  def test_deassign_project
    cake = Project.new('Birthday Cake')
    buy_milk = Task.new('Buy milk', cake)

    # remove task from project
    cake.tasks.delete(buy_milk)

    # check the task and assert that the project is nil
    assert_nil(buy_milk.project)
    assert_equal(0, cake.tasks.size)
  end
end
