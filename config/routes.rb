Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :subs, only: [:new, :create, :destroy, :show, :index, :update] do
    get :edit, on: :member
  end
  resources :posts, only: [:destroy, :update, :show, :edit, :new, :create]
end
