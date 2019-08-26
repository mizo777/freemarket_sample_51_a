class BankAccount < ApplicationRecord
  belongs_to :user
  has_many :transfer_applicatons
end
