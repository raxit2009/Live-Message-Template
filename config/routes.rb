Rails.application.routes.draw do
  get 'welcome/landing'

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#landing'

  get 'chat' => 'conversations#show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :conversations do
    resources :messages
  end
end
