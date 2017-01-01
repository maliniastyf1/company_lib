class Book < ApplicationRecord
  has_many :rents, dependent: :destroy
  has_many :users, :through => :rents

  validates_presence_of :author, :title, :description

  def status_info
    is_rented == false ? "Available" : "Rented"
  end

  def is_rented_by_current_user(current_user)
    rents = Rent.find_by_sql("SELECT * FROM rents WHERE rents.book_id = #{self.id} AND rents.user_id = #{current_user.id}")
    rents.count > 0 && self.is_rented == true
  end

end
