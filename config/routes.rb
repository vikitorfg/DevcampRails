Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get 'portfolio/pythondjango', to: 'portfolios#pythondjango'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toogle_status
    end
  end

  root to: 'pages#home'
end
