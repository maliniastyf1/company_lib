class Book < ApplicationRecord
  has_many :rents, dependent: :destroy
  has_many :users, :through => :rents

  validates_presence_of :author, :title, :description

  def status_info
    status == false ? "Available" : "Rented"
  end

  def rent_book
    @book = Book.find(params(:id))
    @book.status = "Rented"
    @book.rent_history.user_id = current_user
  end

end
