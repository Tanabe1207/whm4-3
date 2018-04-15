Rails.application.routes.draw do

  scope '(/:locale)', constraints: { locale: /\w{2}/ } do

    get 'retire', to:'users#retire'
    # "=>"は実行結果
    #root 'tops#index'
    get 'tops/index'

    get 'offer_details/index'
    get 'login', to:'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to:'sessions#destroy'
    resources 'users'
    resources 'offers'
    # get 'comments/index', to:'comments#index'
    resources "comments"
    # post 'comment', to:'comment#create'
    get 'inquiries/index'
    post 'inquiries/confirm', to:'inquiries#confirm'
    post 'inquiries/thanks', to:'inquiries#thanks'
    post 'users/show', to: 'favorites#create'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  end
end
