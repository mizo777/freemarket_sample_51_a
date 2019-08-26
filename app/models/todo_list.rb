class TodoList < ApplicationRecord
  belongs_to :user
  belongs_to :order
  belongs_to :transaction_message
end
