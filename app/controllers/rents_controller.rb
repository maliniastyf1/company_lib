class RentsController < ApplicationController

  def index
    @rents = Rent.paginate(:page => params[:page],:per_page => 10)
  end
  
  def create
    @rent = Rent.new(rent_params)

    if @rent.save
      redirect_to books_path, notice: "Book was rented successfully"
    else
      redirect_to books_path, alert: "Something went wrong! Try again later"
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