Zenpay::Application.routes.draw do
  resources :users
  resources :checks, :only => [:new, :create]
  resource :session, :only => [:new, :create, :destroy]
end
