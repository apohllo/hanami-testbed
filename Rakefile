require 'rake'
#require 'hanami/rake_tasks'
require 'rake/testtask'
require 'rom/sql/rake_task'

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs    << 'spec'
  t.warning = false
end

desc "Load the full project"
task :environment do
  require 'hanami/environment'
  Hanami::Environment.new.require_project_environment
  Hanami::Components.resolve('all')
end

namespace :db do
  task setup: :environment do
    ROM::SQL::RakeSupport.env = ROM.container(:sql, ENV['DATABASE_URL'])
  end
end

task default: :test
task spec: :test
