Rails.application.routes.draw do
  get 'chronology_test_answers/new'
  get 'welcome/homepage'

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#homepage'

  get 'welcome/index'

  get 'welcome/generic'

  get 'welcome/elements'

  resources :chronology_test_answers

 end
