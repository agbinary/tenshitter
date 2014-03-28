require 'active_record'
require 'logger'

begin
require './env'
rescue LoadError
end

namespace :db do
  task :environment do
    MIGRATIONS_DIR = ENV['MIGRATIONS_DIR'] || 'db/migrations'
    ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"])
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end

  desc 'Migrate the database'
  task :migrate => :environment do
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate MIGRATIONS_DIR, ENV['VERSION'] ? ENV['VERSION'].to_i : nil
  end

  desc 'Rolls the schema back to the previous version'
  task :rollback => :environment do
    step = ENV['STEP'] ? ENV['STEP'].to_i : 1
    ActiveRecord::Migrator.rollback MIGRATIONS_DIR, step
  end

  desc "Retrieves the current schema version number"
  task :version => :environment do
    puts "Current version: #{ActiveRecord::Migrator.current_version}"
  end
end
