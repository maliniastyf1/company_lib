class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates_presence_of :start_date, :end_date, :book_id, :user_id
  validates_with RentDateValidator, if: :start_date && :end_date

end
