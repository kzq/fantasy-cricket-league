Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, constraints: { subdomian: 'api' }, path: '/' do
    resources :leagues, only: [:index]
  end
  
  scope :module, :v2, constraints: ApiConstraint.new(version: 2) do
    resources :leagues, only: [:index]
  end
end
