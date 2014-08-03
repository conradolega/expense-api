require 'sequel'

DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://database.db')

Sequel::Model.plugin :schema

class Expense < Sequel::Model
  set_schema do
    primary_key :id
    Float :amount
    String :item
  end

  create_table unless table_exists?
end
