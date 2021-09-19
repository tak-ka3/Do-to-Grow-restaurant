class Todo < ApplicationRecord
  belongs_to :user # userという名前でアクセスすることができる
end
