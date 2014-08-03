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
                      {item: i.item, amount: i.amount}
                    end
        }
      end

      params do
        requires :amount, type: Integer
        requires :item, type: String
      end
      post do
        expense = Expense.insert(amount: params[:amount], item: params[:item])
      end
    end
  end
end
