class RentsController < ApplicationController

  def index
    @rents = Rent.paginate(:page => params[:page],:per_page => 10)
  end

  def new
  end

  def create

  end

  private

  def rent_params
    params.require(:rent).permit(:book_id, :user_id)
  end

end