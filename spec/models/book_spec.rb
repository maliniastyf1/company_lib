require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @book = Book.create(author: "Head", title: "Ride", description: "Criminal")
  end
  describe 'creation' do
    it 'can be created' do
      expect(@book).to be_valid
    end

    it 'can not be created without a author, title and description' do
      @book.author = nil
      @book.title = nil
      @book.description = nil
      expect(@book).to_not be_valid
    end
  end

  describe 'custom status methods' do
    it 'check if book status is available when book is to rent' do
      expect(@book.status_info).to eq("Available")
    end
  end
end
