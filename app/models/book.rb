class Book < ApplicationRecord
  has_many :rent_histories, dependent: :destroy
  has_many :users, :through => :rent_histories

  validates_presence_of :author, :title, :description

  def status_info
    status == false ? "Available" : "Rent"
  end

end
