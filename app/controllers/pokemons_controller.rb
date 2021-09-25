class PokemonsController < ApplicationController
  before_action :authenticate_user!
  def new
  end

  def index
    @restaurants = Restaurant.where(user_id: current_user.id)
  end

  def create
    if current_user.points < 10
      flash[:danger] = "ポイントが後#{10 - current_user.points}ポイント足りません。"
      redirect_to todos_path
    else
      retry_on_error { restaurant_api }

      name = @shop["name"]
      genre = @shop["genre"]["name"]
      budget = @shop["budget"]["average"]
      address = @shop["address"]
      catch_copy = @shop["catch"]
      photo_url = @shop["photo"]["pc"]["l"]
      url = @shop["urls"]["pc"]

      @restaurant = Restaurant.new(name: name, genre: genre, 
                            budget: budget, address: address, 
                            catch: catch_copy, photo: photo_url,
                            url: url, user_id: current_user.id)
        
      p @restaurant
      if @restaurant.save
        flash[:success] = '飲食店情報を手に入れました。'
        
        current_user.update(points: current_user.points - 10)
        current_user.save
        redirect_to pokemon_path(@restaurant.id)
      else
        flash[:danger] = '飲食店情報が手に入りませんでした。'
        redirect_to new_pokemon_path
      end
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    delete_double
  end

  private
    def restaurant_api
      api_key = "6dbc19172ff32721"
      # 最後にformat=jsonをつけることで、xmlからjson形式変えることができる。
      max_num = Prefecture.find_by(p_id: current_user.prefecture).num
      random_num = rand(0..max_num-1)
      url = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{api_key}&large_area=#{current_user.prefecture}&start=#{random_num}&count=1&format=json"
      uri = URI.parse(url)
      response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == "https") do |http| 
        http.open_timeout = 5
        http.read_timeout = 10
        http.get(uri.request_uri)
      end
      @result = JSON.parse(response.body)["results"]
      @shop = @result["shop"][0]

      raise "Error" unless @shop.present?
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
      Restaurant.all.each do |res|
        if res.name == @restaurant.name
          cnt += 1
        end
      end
      if cnt == 2
        @restaurant.delete
      end
    end
end
