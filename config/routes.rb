Rails.application.routes.draw do
  resources :advertisement

  resources :posts

  get 'about' => 'welcome#about'

  get 'faq' => 'welcome#faq'

  get 'contact' => 'welcome#contact'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
