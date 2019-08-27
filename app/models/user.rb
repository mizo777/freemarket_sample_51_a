class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :orders
  has_many :todo_lists
  has_many :sales, dependent: :destroy
  has_many :transfer_applications
  has_many :points, dependent: :destroy
  has_many :contacts
  has_many :informations
  has_many :notices
  has_many :likes
  has_many :comments
  has_one :bank_account
  has_one :address         
end
