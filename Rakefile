require "bundler/gem_tasks"

require 'rake/testtask'
require 'rdoc/task'

Rake::TestTask.new do |t|
  t.pattern = "spec/*_spec.rb"
end

RDoc::Task.new do |rdoc|
  rdoc.title = "Sinatra::Glorify"
  rdoc.main = "README.md"
  rdoc.rdoc_files.include("README.md", "lib/**/*.rb")
  rdoc.rdoc_dir = "."
  rdoc.options << "-O"
end

desc "clean up existing rdoc files"
task :clean do
  sh "rm *.html"
  sh "rm rdoc.css"
  sh "rm created.rid"
  sh "rm -rf images/"
  sh "rm -rf js/"
end

task(:spec => :test)
task(:default => :test)
