module RentHelper

  def validation_errors(rent)
    if rent.errors.messages.keys.include?(:grater_than_end_date)
      redirect_to books_path, notice: rent.errors.messages[:grater_than_end_date].first
    elsif rent.errors.messages.keys.include?(:grater_than_today)
      redirect_to books_path, notice: rent.errors.messages[:grater_than_today].first
    else
      redirect_to books_path, notice: "Something went wrong! Try again."
    end
  end

end