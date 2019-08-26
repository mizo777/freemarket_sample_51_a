class Notice < ApplicationRecord
  belongs_to :comment
  belongs_to :user
  belongs_to :information
end
