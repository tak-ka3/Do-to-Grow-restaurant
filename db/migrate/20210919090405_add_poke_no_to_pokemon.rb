class AddPokeNoToPokemon < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemons, :poke_no, :integer
  end
end
