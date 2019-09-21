class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]
         
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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session['devise.omniauth_data'])
        user.email = data['email'] if user.email.blank?
        user.nickname = data['name'] if user.nickname.blank?
        user.uid = data['uid'] if data['uid'] && user.uid.blank?
        user.provider = data['provider']
      end
    end
  end
end
