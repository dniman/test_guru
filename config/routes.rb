Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: { sessions: "sessions" }

  resources :tests, only: :index do
    namespace :admin do
      resources :questions, shallow: true, except: [:index] do
        resources :answers, shallow: true, except: [:index]
      end
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
    end
  end
  
  visualize if Rails.env.development?
end

