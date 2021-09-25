class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :genre
      t.string :budget
      t.string :address
      t.string :catch
      t.string :photo

      t.timestamps
    end
  end
end
