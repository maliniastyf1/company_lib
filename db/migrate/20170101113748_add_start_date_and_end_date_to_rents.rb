class AddStartDateAndEndDateToRents < ActiveRecord::Migration[5.0]
  def change
    add_column :rents, :start_date, :date
    add_column :rents, :end_date, :date
  end
end
