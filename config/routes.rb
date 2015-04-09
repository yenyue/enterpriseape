Rails.application.routes.draw do

  resources :products

  resources :employees

  resources :companies do
#    collection { post :import}
    collection do
      post :import
      get :search
    end
  end

  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  get 'welcome/contact'

  get 'welcome/faqs'

  get 'welcome/pricing'

  get 'welcome/features'

  resources :invoices do
    resources :purchases, except: [:index], controller: 'invoices/purchases'
  end

  resources :companies

  root to: 'welcome#index'
end
