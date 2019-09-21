class Order < ApplicationRecord
  has_many :todo_lists
  has_many :transaction_messages
  belongs_to :product, optional: true
  belongs_to :buyer, class_name: "User", optional: true
end
