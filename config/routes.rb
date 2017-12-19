Rails.application.routes.draw do
  resources :courses do
      member do
        get 'grades'
      end
  	resources :evaluations do
  		member do
  			get 'set_grades'
  		end
  		resources :grades
  	end
  	resources :students 
  end

  devise_for :users , only: [:session]
  root to: 'courses#index' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
