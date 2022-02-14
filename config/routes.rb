Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root :controller=>'calculator', :action=>'calculate'
  get '/calculate', :controller=>'calculator', :action=>'calculate'
  
  post '/sum', :controller=>'calculator', :action=>'sum'
  get '/sum', :controller=>'calculator', :action=>'sum'
  
  post '/subtract', :controller=>'calculator', :action=>'subtract'
  get '/subtract', :controller=>'calculator', :action=>'subtract'
  
  post '/divide', :controller=>'calculator', :action=>'divide'
  get '/divide', :controller=>'calculator', :action=>'divide'
  
  post '/multiply', :controller=>'calculator', :action=>'multiply'
  get '/multiply', :controller=>'calculator', :action=>'multiply'
end
