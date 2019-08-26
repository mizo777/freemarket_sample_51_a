class Category < ApplicationRecord
  has_many :products
  has_many :children
  belongs_to :parent ​ ​
end
