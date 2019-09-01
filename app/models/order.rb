class Order < ApplicationRecord
  has_many :todo_lists
  has_many :transaction_messages
  belongs_to :product
  belongs_to :user
  belongs_to :point
end
