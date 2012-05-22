require "bundler/gem_tasks"

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = "spec/*_spec.rb"
end

task(:spec => :test)
task(:default => :test)
