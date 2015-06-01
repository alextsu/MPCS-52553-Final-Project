Rails.application.routes.draw do
    
    #Set root to index as default
    root 'users#index'

    get 'password_resets/new'

    get "/signup" => 'users#new'
    post "/users" => 'users#create'

    post '/eventsignups/:event_id'  => 'eventsignups#create'
    delete '/eventsignups/:event_id'  => 'eventsignups#destroy'
    
    get "/login" => 'sessions#new'
    delete "/logout" => 'sessions#destroy'
    post '/sessions' => 'sessions#create'

    #Generate Golden 7 for the following controllers
    resources :users
    resources :password_resets
    resources :locations
    resources :universities
    resources :events

    get '/history/clear' => 'histories#destroy'

end
