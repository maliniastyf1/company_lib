class RemoveStatusFromBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :status, :string
  end
end
