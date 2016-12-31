class Book < ApplicationRecord
  has_many :rents, dependent: :destroy
  has_many :users, :through => :rents

  validates_presence_of :author, :title, :description

  def status_info
    status == false ? "Available" : "Rented"
  end

end
