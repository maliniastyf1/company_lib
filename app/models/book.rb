class Book < ApplicationRecord
  validates_presence_of :author, :title, :description
  
end
