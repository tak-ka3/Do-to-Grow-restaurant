class PokemonsController < ApplicationController
  before_action :authenticate_user!
  def new
  end

  def index
    @pokemons = Pokemon.all
  end

  def create
    if current_user.points < 10
      flash[:danger] = "ポイントが後#{10 - current_user.points}ポイント足りません。"
      redirect_to todos_path
    else
      retry_on_error { pokemon_api }

      name = @result['name']
      poke_no = @result['id']
      img = @result['sprites']['front_default']
      pokemon_type = @result['types'][0]['type']['name']

      @pokemon = Pokemon.new(name: name, pokemon_type: pokemon_type, 
                            img: img, user_id: current_user.id, 
                            poke_no: poke_no)
    
      if @pokemon.save
        flash[:success] = 'ポケモンをゲットできました。'
        
        current_user.update(points: current_user.points - 10)
        current_user.save
        redirect_to pokemon_path(@pokemon.id)
      else
        flash[:danger] = 'ポケモンをゲットできませんでした。'
        redirect_to new_pokemon_path
      end
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    delete_double
  end

  private
    def pokemon_api
      random_id = rand(1..898)
      url = "https://pokeapi.co/api/v2/pokemon/#{random_id}/"
      uri = URI.parse(url)
      response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http| 
        http.open_timeout = 5
        http.read_timeout = 10
        http.get(uri.request_uri)
      end
      @result = JSON.parse(response.body)

      raise "Error" unless @result["name"].present?
    end

    def retry_on_error(times: 3)
      try = 0
      begin
        try += 1
        yield
      rescue => exception
        retry if try < times
        false
      end
    end

    # 被りをデータベースから削除している
    def delete_double
      cnt = 0
      Pokemon.all.each do |poke|
        if poke.name == @pokemon.name
          cnt += 1
        end
      end
      if cnt == 2
        @pokemo.delete
      end
    end
end
