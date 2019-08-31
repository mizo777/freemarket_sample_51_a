class ProductImage < ApplicationRecord
  belongs_to :product, optional: true

  validates :name, presence: true
end
