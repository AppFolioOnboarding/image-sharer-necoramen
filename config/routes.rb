Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'images#index'
  resources :images
  post '/api/feedbacks', to: 'feedbacks#create'
end
