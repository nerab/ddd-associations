require 'helper'
require 'tempfile'

class TestTaskRepository < MiniTest::Unit::TestCase
  include Dilatory

  def setup
    @data_dir = Dir.mktmpdir
    @repo = TaskRepository.new(@data_dir)
  end

  def teardown
    FileUtils.rm_r(@data_dir) if @data_dir && Dir.exist?(@data_dir)
  end

  def test_all_empty
    assert_equal(0, @repo.all.size)
  end
end
