# encoding: UTF-8

require 'rake'
include Rake::DSL if defined?(Rake::DSL)

require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake/testtask'
require 'rake/rdoctask'
require File.join(File.dirname(__FILE__), 'lib', 'mm-devise', 'version')

desc 'Run Devise tests using MongoMapper. Specify path to devise with DEVISE_PATH'
Rake::TestTask.new(:test) do |test|
  ENV['DEVISE_ORM'] ||= 'mongo_mapper'
  ENV['DEVISE_PATH'] ||=  File.join(File.dirname(__FILE__), '../devise')
  unless File.exist?(ENV['DEVISE_PATH'])
    puts "Specify the path to devise (e.g. rake DEVISE_PATH=/path/to/devise). Not found at #{ENV['DEVISE_PATH']}"
    exit
  end
  
  test.libs << 'lib' << 'test'
  test.libs << "#{ENV['DEVISE_PATH']}/lib"
  test.libs << "#{ENV['DEVISE_PATH']}/test"
  test.test_files = FileList["#{ENV['DEVISE_PATH']}/test/**/*_test.rb"] +  FileList['test/**/*_test.rb'] 
  test.verbose = true
end

desc 'Default: run tests for MongoMapper'
task :default => :test
