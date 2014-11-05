require 'sequel'

DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://database.db')

Sequel::Model.plugin :timestamps

class Expense < Sequel::Model
  plugin :timestamps, :update_on_create => true
end

