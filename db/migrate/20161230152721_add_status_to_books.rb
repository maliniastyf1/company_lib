class AddStatusToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :status, :boolean, :default => false
  end
end
