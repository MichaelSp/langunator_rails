Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :translations do
        get :query, on: :collection
      end
    end
  end

  get 'statics/home'
  root 'statics#home'

  devise_for :users, skip: [:sessions, :registrations]

  devise_scope :user do
    get    "login"   => "devise/sessions#new",         as: :new_user_session
    post   "login"   => "devise/sessions#create",      as: :user_session
    delete "signout" => "devise/sessions#destroy",     as: :destroy_user_session
    
    get    "signup"  => "devise/registrations#new",    as: :new_user_registration
    post   "signup"  => "devise/registrations#create", as: :user_registration
    put    "signup"  => "devise/registrations#update", as: :update_user_registration
    get    "account" => "devise/registrations#edit",   as: :edit_user_registration
  end

end
