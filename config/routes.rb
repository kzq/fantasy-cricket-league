require 'api_constraints'
Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, constraints: { subdomian: 'api' }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :leagues, only: [:index, :create, :show, :update, :destroy]
      resources :users, only: [:create]
      post 'login' => 'authentication#authenticate_user'   
    end
  end
end
