class CreatePrefectures < ActiveRecord::Migration[6.1]
  def change
    create_table :prefectures do |t|
      t.string :p_id
      t.string :name
      t.integer :num

      t.timestamps
    end
  end
end
