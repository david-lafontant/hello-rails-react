Rails.application.routes.draw do
  root 'static_pages#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :v1, defaults: { format: 'json' } do
    get 'greeting', to: 'greetings#index'
  end

  get '*page', to: 'static#index', constraints: ->(req) do
    !req.xhr? && req.format.html?
  end
end
