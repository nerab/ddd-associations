require 'helper'

class TestTask < MiniTest::Unit::TestCase
  include DDD::Aggregates

  def test_task_without_project
    task = Task.new('Buy milk')
    assert_nil(task.project)
  end
end
