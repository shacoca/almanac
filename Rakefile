require_relative "./config/environment"
require 'rake'

require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'

# TODO: Find out where these lines go?
def reload!
  load './lib'
end

task :console do
  Pry.start
end

desc "Run unit specs"
RSpec::Core::RakeTask.new(:unit) do |t|
  t.rspec_opts = %w(-fd -c)
  t.pattern = "./spec/unit/**/*_spec.rb"
end

desc "Run integration specs that are very high level"
RSpec::Core::RakeTask.new(:integration) do |t|
  t.rspec_opts = %w(-fd -c)
  t.pattern = "./spec/integration/**/*_spec.rb"
end

desc "Run all specs"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w(-fd -c)
end

# this is for running tests that you've marked current... eg: it 'should work', :current => true do
RSpec::Core::RakeTask.new(:current) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rspec_opts = ['--tag current']
end

# alias for current
RSpec::Core::RakeTask.new(:c) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rspec_opts = ['--tag current']
end

task :default => :spec
task :test => :spec


