class User < ApplicationRecord
  has_many :rent_histories
  has_many :books, :through => :rent_histories

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
