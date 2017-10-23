Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Endpoint to login a user register previously
  post 'auth/login', to: 'authentication#authenticate'

  # Endpoint to create new student user
  post 'signup', to: 'users#create'

end
