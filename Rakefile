<<<<<<< HEAD
begin
  require './env'
rescue LoadError
end

namespace :db do
  task :environment do
    require "./environment"
    MIGRATIONS_DIR = ENV['MIGRATIONS_DIR'] || 'db/migrations'
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
=======
begin
  require './env'
rescue LoadError
end

namespace :db do
  task :environment do
    require "./environment"
    MIGRATIONS_DIR = ENV['MIGRATIONS_DIR'] || 'db/migrations'
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
>>>>>>> c18d6aa0316fffec063e8484590e00b96fcb5f75
