Rails.application.routes.draw do
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#homepage'

  get 'welcome/index'

  get 'welcome/generic'

  get 'welcome/elements'

  resources :chronology_test_answers

  get '/newTemplate', to: 'chronology_test_answers#new'
  get '/existingTemplateRenderAnswer', to: 'chronology_test_answers#show'
  put 'chronology_test_answers/edit'
  get 'sessions/new'

  get '/chronologyTestLogin', to: 'sessions#new', as: "chronologyTestLogin"
  post '/chronologyTestLogin', to: 'sessions#create'
  delete '/chronologyTestLogout', to: 'sessions#destroy'

 end
