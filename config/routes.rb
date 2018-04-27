Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'squares#index'

  get 'update_squares' => 'squares#update_squares'
  get 'leader_board' => 'squares#leader_board', as: :leader_board
end
