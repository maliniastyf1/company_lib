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
    end
  end
