Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'posts/new', to: 'posts#new', as: 'new_posts'
  get 'topics/new', to: 'topics#new',as: 'new_topics'
  get 'topics/:id/edit' , to: 'topics#edit', as: 'edit_topics'
end
