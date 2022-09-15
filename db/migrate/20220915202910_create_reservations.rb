class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :city
      t.datetime :date

      t.timestamps
    end
    add_reference(:reservations, :user, foreign_key: { to_table: :users })
    add_reference(:reservations, :item, foreign_key: { to_table: :items })
  end
end
