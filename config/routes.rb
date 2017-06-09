Rails.application.routes.draw do

  namespace :api do
  	resources :activities, only: :index
  	resources :babies, only: :index do
  		resources :activity_logs, only: :index
  	end
  	resources :activity_logs, only: [:create, :update]
  end

  resources :activity_logs, only: :index
end