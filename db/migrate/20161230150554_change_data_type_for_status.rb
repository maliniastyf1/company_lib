class ChangeDataTypeForStatus < ActiveRecord::Migration[5.0]
  def change
    change_column_default :books, :status, false
  end
end
