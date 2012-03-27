require 'rubygems'
require 'rake'

begin
  require 'jeweler2'
  Jeweler::Tasks.new do |gem|
    gem.name = "jsonable"
    gem.summary = "Makes your json classes serializable."
    gem.description = "Makes your json classes serializable."
    gem.email = "travis@iron.io"
    gem.homepage = "http://www.iron.io"
    gem.authors = ["Travis Reeder"]
    #gem.add_dependency 'rest', '>= 0.1.2'
    gem.required_ruby_version = '>= 1.9'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler2 (or a dependency) not available. Install it with: gem install jeweler2"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test
