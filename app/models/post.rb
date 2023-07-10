class Post < ApplicationRecord
   # Validation
  validates :title, presence: true
  validates :body, presence: true

  # ActiveStorage
  has_one_attached :image
  # この行を追加する
  has_many :comments, dependent: :destroy
end