Rails.application.routes.draw do

  get 'retire', to:'users#retire'
  # "=>"は実行結果

  get 'offer_details/index'

  root 'tops#index'
  root 'tops#search'

  get 'login', to:'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to:'sessions#destroy'
  get 'rooms/show'
  resources 'users'
  resources 'offers'

  get 'inquiries/index'

  post 'inquiries/confirm', to:'inquiries#confirm'
  post 'inquiries/thanks', to:'inquiries#thanks'

  post 'users/show', to: 'favorites#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
