  require 'rails_helper'

  describe 'navigate' do
    describe 'index' do
      it 'can be reached successfully' do
        visit books_path
        expect(page.status_code).to eq(200)
      end
      it 'has a title of Books' do
        visit books_path
        expect(page).to have_content(/Books/)
      end
    end

    describe 'creation' do
      before do
        user = User.create(email: "adam@test.com", password: "qwerty", password_confirmation: "qwerty", first_name: "Adam", last_name: "Malyn")
        login_as(user, :scope => :user)
        visit new_book_path
      end
      it 'has a new form that can be reached' do
        expect(page.status_code).to eq(200)
      end

      it 'can be created from new form page' do
        fill_in 'book[author]', with: "Adam"
        fill_in 'book[title]', with: "Lord"
        fill_in 'book[description]', with: "Lord is fantasy book"
        click_on "Save"

        expect(page).to have_content("Lord is fantasy book")
      end

      it 'will have a user assosiated' do
        fill_in 'book[author]', with: "Malyn"
        fill_in 'book[title]', with: "Book"
        fill_in 'book[description]', with: "Book Association"

        click_on "Save"

        expect(User.last.books.last.description).to eq("Book Association")
      end
    end
  end
