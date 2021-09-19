class PokemonsController < ApplicationController
  def new
  end

  def index
    @pokemons = Pokemon.all
  end

  def create

    random_id = rand(1..898)
    url = "https://pokeapi.co/api/v2/pokemon/#{random_id}/"
    uri = URI.parse(url)
    response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http| 
      http.open_timeout = 5
      http.read_timeout = 10
      http.get(uri.request_uri)
    end
    result = JSON.parse(response.body)

    name = result['name']
    id = result['id']
    img = result['sprites']['front_default']
    pokemon_type = result['types'][0]['type']['name']

    @pokemon = Pokemon.new(name: name, pokemon_type: pokemon_type, img: img, user_id: current_user.id)
    
    if @pokemon.save
      flash[:success] = '正しくポケモンが登録されました。'
      
      binding.pry
      
      redirect_to pokemon_path(@pokemon.id)
    else
      flash[:danger] = 'ポケモンが登録されませんでした。'
      redirect_to new_pokemon_path
    end
    
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end
