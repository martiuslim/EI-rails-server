Rails.application.routes.draw do
  
  get '/criminals/find', to: 'criminals#find'
  resources :criminals
  
  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
