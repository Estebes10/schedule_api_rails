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

      # endpoints following /api/v1/departments
      resources :departments, only: %I[index show create update destroy] do

        # endpoints following /api/v1/departments/:department_id/careers
        resources :careers, only: %I[index show create update destroy] do

          # endpoints following
          # /api/v1/departments/:department_id/careers/:career_id/study_programs
          resources :study_programs, only: %I[index show create update destroy ] do

            # endpoints following
            # /api/v1/departments/:department_id/careers/:career_id/study_programs/:study_program_id/courses
            resources :courses, only: %I[index show create update destroy]

          end

        end

      end

    end

  end

end
