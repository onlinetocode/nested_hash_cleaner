#!/usr/bin/env rake
require "bundler/gem_tasks"
 
require 'rake/testtask'
 
Rake::TestTask.new do |t|
  t.libs << 'lib/nested_hash_cleaner'
  t.libs << 'spec'
  t.test_files = FileList['test/lib/nested_hash_cleaner/*_test.rb']
  t.verbose = true
end