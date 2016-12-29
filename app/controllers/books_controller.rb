class BooksController < ApplicationController
  before_action :set_book, only: [:show]
  def index
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: "Your book was added successfully"
    else
      render 'new'
    end
  end

  def show
  end

  private

  def book_params
    params.require(:book).permit(:author, :title, :description)
  end

  def set_book
    @book = Book.find(params[:id])
  end

end
