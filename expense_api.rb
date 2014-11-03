require 'grape'
require 'sequel'

module ExpenseApp
  class API < Grape::API
    version 'v1'
    format :json

    get do
      {hello: 'world'}
    end

    resource :expenses do
      get do
        {
          total: Expense.count,
          expenses: Expense.all.map do |i|
                      {description: i.description, amount: i.amount}
                    end
        }
      end

      params do
        requires :amount, type: Integer
        requires :description, type: String
      end
      post do
        expense = Expense.insert(amount: params[:amount], description: params[:description])
      end
    end
  end
end
