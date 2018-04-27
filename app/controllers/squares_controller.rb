class SquaresController < ApplicationController
  before_action :get_user, except: [:leader_board]

  def index
    if cookies[:user_id].nil?
      @user = User.create(user_name: Faker::Name.name)
      cookies[:user_id] = @user.id
    end
    @squares = Square.includes(:user_squares).order('id asc').each_slice(20).to_a
  end

  def update_squares
    square = Square.find_by_id(params[:id])
    square.update(previous_color: square.current_color, current_color: params[:color], user_name: @user.user_name)
    @user.user_squares.create(square_id: square.id, color: params[:color])

    @squares = Square.includes(:user_squares).order('id asc').each_slice(20).to_a
    return render partial: 'update_squares'
  end

  def leader_board
    @max_count = UserSquare.all.group_by(&:user_id).map { |h,k| { user: h, count: k.count } }.max_by{ |k| k[:count] }
    @user = User.find_by_id(@max_count[:user])

  end

  private

  def get_user
    @user = User.find_by_id(cookies[:user_id])
  end
end