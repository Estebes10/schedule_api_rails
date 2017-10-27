Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Endpoint to login a user register previously
  post 'auth/login', to: 'authentication#authenticate'

  # Endpoint to create new student user
  post 'signup', to: 'users#create'

  # endpoints following /api/
  namespace :api do

    # endpoints following /api/v1/
    namespace :v1 do

      resources :study_programs,
        only:  [:create, :index, :update]

      # endpoints following /api/v1/courses
      resources :courses,
        only: [:create]

    end

  end

end
