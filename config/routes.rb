Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trips do
    resources :accomodations, only: [:index, :new, :create]
    resources :participants, only: [:new, :create, :destroy]
    resources :transportations, only: [:index]
  end
  resources :accomodation_votes, only: [:destroy]
  resources :accomodations, only: [:show, :edit, :update]

  resources :transportations, only: [:show, :edit, :update, :index]
  resources :expenses, only: [:index, :edit, :update, :show, :destroy]
  resources :events, only: [:index, :edit, :update, :show, :destroy] do
    resources :event_participants, only: [:new, :create, :destroy]
  end
  resources :participants, only: [] do
    resources :transportations, only: [:new, :create]
    resources :expenses, only: [:index, :new, :create]
    resources :events, only: [:new, :create]
    resources :accomodations, only: [] do
      resources :accomodation_votes, only: [:new, :create]
    end
  end
end
