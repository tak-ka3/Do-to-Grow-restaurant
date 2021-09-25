class User < ApplicationRecord
  has_many :todos
  has_many :pokemons
  has_many :restaurants
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :prefecture, presence: true
end
