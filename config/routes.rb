Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'auth/login', to: 'authentication#authenticate'

  post 'signup', to: 'users#create'

  namespace :api do

    namespace :v1 do

      resources :study_programs,
        only:  [:create]

    end

  end

end
