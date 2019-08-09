class User < ApplicationRecord

  with_options presence: true do
    validates :email
    validates :password
    validates :password_confirmation
    validates :nickname
    validates :first_name
    validates :last_name
    validates :first_kana_name
    validates :last_kana_name
    validates :birthday
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :password, length: { in: 7..128 }

  validate :add_error
  
  def add_error
    unless password.match(/([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/)
      errors.add(:password, "は、英字と数字両方を含むものを設定してください")
    end

    unless password_confirmation == password or password != nil
      errors.add(:password_confirmation, "が一致しません")
    end
  end
end
