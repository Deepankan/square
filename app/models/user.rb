class User < ApplicationRecord
  has_many :user_squares, dependent: :destroy
  has_many :squares, through: :user_squares
end
