Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'session#create'
  get '/auth/github', as: 'new_session'
  get '/logoff', to: 'session#destroy', as: 'destroy_session'

  resources :sites
  resources :users

  get '/:short_code', to: 'sites#decode'
  root to: 'basic#index'
end
