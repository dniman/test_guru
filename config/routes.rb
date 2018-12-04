Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true, except: [:index]
    put :question, path: 'questions/:question_id'
  end
end

