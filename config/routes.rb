Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get '/api/top', to: 'api/spots#top'

  namespace 'api' do
    resources :spots
    resources :reviews, only: [:create, :destroy]
    resources :users
  end
end
