#Rails.application.routes.draw do
Blogger::Application.routes.draw do
  # so we have  'resource' and it is called ':articles'
  # and router should expect requests to follow the RESTful mod of web interaction
  root to: 'articles#index'
  resources :articles do
      resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# if resources :articles is uncommented
# => You don't have any routes defined!
# => Add some routes in confit/routes.rb
