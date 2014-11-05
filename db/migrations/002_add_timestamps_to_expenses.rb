Sequel.migration do
  change do
    add_column :expenses, :created_at, DateTime
    add_column :expenses, :updated_at, DateTime
  end
end
