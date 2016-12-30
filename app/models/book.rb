class Book < ApplicationRecord
  has_many :rent_histories
  has_many :users, :through => :rent_histories

  validates_presence_of :author, :title, :description

end
