Sequel.migration do
  change do
    create_table :expenses do
      primary_key :id
      Float :amount
      String :description
    end
  end
end
