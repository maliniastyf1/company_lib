  require 'rails_helper'

  describe 'navigate' do
    before do
      @user = FactoryGirl.create(:user)
      login_as(@user, :scope => :user)
    end
    describe 'index' do
      before do
        visit books_path
      end
      it 'can be reached successfully' do
        expect(page.status_code).to eq(200)
      end
      it 'has a title of Books' do
        expect(page).to have_content(/Books/)
      end

      it 'has a list of books' do
        book1 = Book.create(author: "Head1", title: "Ride1", description: "Criminal1")
        book2 = Book.create(author: "Head2", title: "Ride2", description: "Criminal2")
        visit books_path

        expect(page).to have_content(/Criminal1|Criminal2/)
      end
    end

    describe 'new' do
      it 'has a link from homepage' do
        visit root_path

        click_link("new_book_from_nav")
        expect(page.status_code).to eq(200)

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

      it 'will have a user assosiated' do
        fill_in 'book[author]', with: "Malyn"
        fill_in 'book[title]', with: "Book"
        fill_in 'book[description]', with: "Book Association"

        click_on "Save"

        expect(User.last.books.last.description).to eq("Book Association")
      end
    end

    describe 'edit' do
      before do
        @book = Book.create(author: "Head1", title: "Ride1", description: "Criminal1")
      end
      it 'can be reached by clicking edit on index page' do
        visit books_path

        click_link("edit_#{@book.id}")
        expect(page.status_code).to eq(200)
      end

      it 'can be edited' do
       visit edit_book_path(@book)

       fill_in 'book[author]', with: "Adam"
       fill_in 'book[title]', with: "Lord"
       fill_in 'book[description]', with: "Edited Lord is fantasy book"
       click_on "Save"

       expect(page).to have_content("Edited Lord is fantasy book")

      end
    end

    describe 'delete' do
      before do
        @book = Book.create(author: "Head1", title: "Ride1", description: "Criminal1")
      end
      it 'can be reached by clicking delete on index page' do
        visit books_path

        click_link("edit_#{@book.id}")
        expect(page.status_code).to eq(200)
      end

    end
  end
