Rails.application.routes.draw do
  devise_for :users

  root to: 'bank_accounts#index'

  get "/admin", to: 'admin#index', as: "admin"
  post "/admin", to: 'admin#deposit'

  # management of user's personal accounts (in use only index and show for 1 account each)
  resources :bank_accounts, only: [:index, :new, :create, :update] do
    # transfer credit between users
    resources :transactions, only: [:index, :new, :create]
  end
end
