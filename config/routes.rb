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
      
  #resources :contact_form, only: :new do
  #  post :send_message
  #end
  get "contact_form/new", as: :contact_form
  post "contact_form/send_message"
  
  visualize if Rails.env.development?
end

