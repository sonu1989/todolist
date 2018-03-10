Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todos
  post '/todo/:id/item/:item_id/toggle_state', to: 'todos#toggle_state'



  root 'welcome#index'
end
