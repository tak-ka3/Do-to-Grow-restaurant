class AddPrefectureToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :prefecture, :string, null: false
  end
end
