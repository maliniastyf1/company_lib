class RentDateValidator < ActiveModel::Validator

  def validate(record)
    check_start_date_greater_than_end_date(record)
    check_start_date_less_than_today(record)
  end

  def check_start_date_greater_than_end_date(record)
    if record.start_date > record.end_date
      record.errors[:grater_than_end_date] << "Start date can't be greater than end date"
    end
  end

  def check_start_date_less_than_today(record)
    if record.start_date < Date.today
      record.errors[:grater_than_today] << "Start date can't be before today"
    end
  end

end
