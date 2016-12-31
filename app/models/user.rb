class User < ApplicationRecord
  has_many :rents
  has_many :books, :through => :rents

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]


  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first
    user
  end
end
