#!/usr/bin/env rake

require 'rake/testtask'

Rake::TestTask.new do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/test_*.rb'
end

task :default => :test
