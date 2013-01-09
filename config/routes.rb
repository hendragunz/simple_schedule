Schedule::Application.routes.draw do
  devise_for :users

  resource :home, controller: 'home', only: [:show]
  resources :events do
    collection do
      post 'batch_update'
    end
  end

  root to: 'home#show'
end
