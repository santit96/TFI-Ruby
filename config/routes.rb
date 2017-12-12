Rails.application.routes.draw do
  resources :grades
  resources :evaluations
  resources :students
  resources :courses

  devise_for :users , only: [:session]
  root to: 'courses#index' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
