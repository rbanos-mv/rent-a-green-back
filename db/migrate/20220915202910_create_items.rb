class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :photo
      t.string :range

      t.timestamps
    end
  end
end
