class Category < ApplicationRecord
  has_many :products
  has_ancestry
  # has_many :children
  # belongs_to :parent, optional: true

  validates :name, presence: true
end
