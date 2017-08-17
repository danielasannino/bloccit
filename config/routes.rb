Rails.application.routes.draw do
  get '/about', to: 'welcome#about'

  get '/faq', to: 'welcome#faq'

  get '/contact', to: 'welcome#contact'

  get 'welcome/faq'

  get 'welcome/contact'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
