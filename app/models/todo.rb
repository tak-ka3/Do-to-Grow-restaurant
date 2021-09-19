class Todo < ApplicationRecord
  belongs_to :user # userという名前でアクセスすることができる

  validates :task, presence: true
  validates :priority, presence: true
  validates :due, presence: true
end
