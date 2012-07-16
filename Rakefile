#!/usr/bin/env rake

require 'rake/testtask'

Rake::TestTask.new do |test|
  test.libs << 'lib' << 'test/domain' << 'test/unit'
  test.pattern = 'test/unit/test_*.rb'
end

task :default => :test
