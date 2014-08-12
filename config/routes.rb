Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :promotions, only: [:new, :create, :show]

  root 'home#index'
end
