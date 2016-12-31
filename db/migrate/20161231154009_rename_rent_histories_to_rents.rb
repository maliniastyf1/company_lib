class RenameRentHistoriesToRents < ActiveRecord::Migration[5.0]
  def change
    rename_table :rent_histories, :rents
  end
end
