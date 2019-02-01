Rails.application.routes.draw do
  root 'currencies#show', id: 'EUR'

  resources :currencies, only: :show
end
