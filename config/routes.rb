#POST /player
#POST /game
#PUT /game/id

Rails.application.routes.draw do
  
  resources :game, :player do
  end


end
