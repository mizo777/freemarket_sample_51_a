class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_format_of :password, with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/, message: "英字と数字両方を含むパスワードを設定してください "
  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :first_kana_name
    validates :last_kana_name
    validates :birthday
  end  
end
