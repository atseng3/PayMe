Zenpay::Application.routes.draw do
  resources :users do
      resources :checks
  end
  resource :session, :only => [:new, :create, :destroy]
end
