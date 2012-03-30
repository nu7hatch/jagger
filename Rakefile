# -*- ruby -*-
require 'rubygems'
require 'bundler/setup'
require 'rake'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ENV['RSPEC_OPTS']
end

task :test => :spec
task :default => :test

desc "Opens console with loaded env."
task :console do
  $LOAD_PATH.unshift("./lib")
  require 'jagger'
  require 'irb'
  ARGV.clear
  IRB.start
end
