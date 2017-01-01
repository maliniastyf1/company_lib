class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :books, :status, :is_rented
  end
end
