Rails.application.routes.draw do
  resources :mangas, only: [:index, :show, :new, :create] do
    resources :loans, only:  [:new, :create]
  end

  devise_for :users
  root to: 'mangas#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
