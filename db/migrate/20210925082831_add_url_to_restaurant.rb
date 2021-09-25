class AddUrlToRestaurant < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :url, :string
  end
end
