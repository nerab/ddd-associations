require 'helper'

class TestTask < MiniTest::Unit::TestCase
  include Dilatory

  def test_task_without_project
    task_title = 'Buy milk'
    buy_milk = Task.new(task_title)

    assert_equal(task_title, buy_milk.title)
    assert_nil(buy_milk.project)
  end

  def test_assign_project
    buy_milk = Task.new('Buy milk')
    cake = Project.new('Birthday Cake')
    buy_milk.project = cake

    assert_equal(cake, buy_milk.project)
    assert_equal(1, buy_milk.project.tasks.size)
    assert_equal(1, buy_milk.project.tasks.first.project.tasks.first.project.tasks.size)
   end

   def test_deassign_project
    cake = Project.new('Birthday Cake')
    buy_milk = Task.new('Buy milk', cake)

    assert_equal(cake, buy_milk.project)
    refute_nil(buy_milk.project)
    assert_equal(1, buy_milk.project.tasks.size)
    assert_equal(1, cake.tasks.size)

    buy_milk.project = nil

    assert_nil(buy_milk.project)
    assert_equal(0, cake.tasks.size)
   end
end
