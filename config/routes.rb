Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :documents, only: %i[new create index destroy]
  root to: 'documents#index'
end
