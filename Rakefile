require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
 
begin
  require 'jeweler'
  Jeweler::Tasks.new do |g|
    g.name = 'presentable'
    g.summary = %(Making presenters easy and fun!)
    g.description = %(Making presenters easy and fun!)
    g.email = 'matt@toastyapps.com'
    g.homepage = 'http://github.com/toastyapps/presentable'
    g.authors = %w(toastyapps)
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts 'Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com'
end
 
Rake::TestTask.new do |t|
  t.libs = %w(test)
  t.pattern = 'test/**/*_test.rb'
end
 
task :default => :test