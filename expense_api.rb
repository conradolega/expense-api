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
                      i.to_hash
                    end
        }
      end

      params do
        requires :id, type: Integer
      end
      route_param :id do
        get do
          Expense[params[:id]].to_hash
        end
      end

      params do
        requires :amount, type: Integer
        requires :description, type: String
      end
      post do
        expense = Expense.create(amount: params[:amount], description: params[:description])
        {status: 'success'}
      end
    end
  end
end
