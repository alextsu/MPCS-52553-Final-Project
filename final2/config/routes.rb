Rails.application.routes.draw do
    
    root 'users#index'
    
    ##### Sign Up and Sign In and Sign Out
    get "/signup" => 'users#new'
    post "/users" => 'users#create'
    
    get "/login" => 'sessions#new'
    post '/sessions' => 'sessions#create'
      
    #########################################################
    # The "Golden 7" for accessing the "users" resource
    
    resources :users
    resources :locations
    resources :universities
    resources :events

end
