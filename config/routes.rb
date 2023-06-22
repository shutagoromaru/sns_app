Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'topics/new', to: 'topics#new'
  get 'topics/:id/edit' , to: 'topics#edit', as: :edit_topic
end
