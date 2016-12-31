class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  def index
    @books = Book.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_ids = current_user.id
    if @book.save
      redirect_to @book, notice: "Your book was added successfully"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Your book was updated successfully"
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to books_path, notice: "Your book was deleted successfully"
  end

  private

  def book_params
    params.require(:book).permit(:author, :title, :description)
  end

  def set_book
    @book = Book.find(params[:id])
  end

end
