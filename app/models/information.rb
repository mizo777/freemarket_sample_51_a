class Information < ApplicationRecord
  belongs_to :contact
  belongs_to :notice
  belongs_to :user
end
