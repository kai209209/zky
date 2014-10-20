Rails.application.routes.draw do

  # devise_for :users
  devise_for :users, :controllers => { :registrations => "registrations" }
  resource :user

  root to: 'static#index'
  
end
