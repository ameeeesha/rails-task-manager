Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # create a new task
  get '/tasks/new', to: 'tasks#new', as: :new_task
  post '/tasks', to: 'tasks#create', as: :tasks

  # List all the tasks -> index
  get '/tasks', to: 'tasks#index'

  # get the description
  get '/tasks/:id', to: 'tasks#show', as: :task

  # Update a task
  get '/tasks/:id/edit', to: 'tasks#edit', as: :edit_task
  patch '/tasks/:id', to: 'tasks#update'

  # Destroy
  delete '/tasks/:id', to: 'tasks#destroy'
end
