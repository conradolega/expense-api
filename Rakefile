require 'sequel'

namespace :db do
  task :reset do
    Sequel.extension :migration
    db = Sequel.connect(ENV['DATABASE_URL'])
    Sequel::Migrator.run(db, 'db/migrations', :target => 0)
    Sequel::Migrator.run(db, 'db/migrations')
    puts 'Database reset.'
  end
  task :migrate do
    Sequel.extension :migration
    db = Sequel.connect(ENV['DATABASE_URL'])
    Sequel::Migrator.run(db, 'db/migrations')
    puts 'Database migrated to latest version.'
  end
end
