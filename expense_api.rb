require 'grape'

module Expense
  class API < Grape::API
    version 'v1'
    format :json

    get do
      {hello: 'world'}
    end
  end
end
