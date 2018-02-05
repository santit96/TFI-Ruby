Rails.application.routes.draw do
  resources :courses do
      member do
        get 'grades'
      end
  	resources :evaluations do
  		member do
  			get 'set_grades'
  		end
  		resources :grades , except:[:show, :index, :destroy]
  	end
  	resources :students 
  end

  devise_for :users , only: [:session]
  root to: 'courses#index' 
  
end
