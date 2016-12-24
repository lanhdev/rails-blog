Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles do
    resources :comments
  end
  get 'tags/:tag', to: 'articles#index', as: "tag"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
