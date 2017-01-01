class RentsController < ApplicationController
  include RentHelper
  def index
    @rents = Rent.paginate(:page => params[:page],:per_page => 10)
  end

  def create
    @rent = Rent.new(rent_params)
    @book = Book.find(rent_params[:book_id])
    if @rent.save
      @book.update(status: true)
      redirect_to books_path, notice: "Book was rented successfully"
    else
      validation_errors(@rent)
    end
  end

  def show_book_to_rent
    @book = Book.find(params[:book_id])
    @rent = Rent.new
    @rent.user = current_user
    @rent.book = @book
  end

  private

  def rent_params
    params.require(:rent).permit(:book_id, :user_id, :start_date, :end_date)
  end

end