Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :promotions, only: [:index, :new, :create, :show] do
    member do
      get :print
    end
  end

  resources :cards, only: [:update]

  root 'home#index'

  get '/:token', to: 'promotions#redeem', constraints: {token: /.{10}/}
end
