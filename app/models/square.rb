class Square < ApplicationRecord
  has_many :user_squares, dependent: :destroy
  has_many :users, through: :user_squares
end
