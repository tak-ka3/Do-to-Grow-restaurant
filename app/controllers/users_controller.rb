class UsersController < ApplicationController
  def new
  end

  def index
  end

  def create
  end

  def show
  end

  def stamp
    @points = current_user.points
    @can_do = @points / 10 # ガチャを引ける回数
  end
end
