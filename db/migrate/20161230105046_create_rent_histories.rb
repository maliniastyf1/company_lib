class CreateRentHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :rent_histories do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.date :rent_time

      t.timestamps
    end
  end
end
