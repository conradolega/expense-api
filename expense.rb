require 'sequel'

DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://database.db')

class Expense < Sequel::Model; end
