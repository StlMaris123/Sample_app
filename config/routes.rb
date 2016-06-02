Rails.application.routes.draw do
root 'static_pages#home'
get 'help' => 'static_pages#help'
get 'about' => 'static_pages#about'
get 'contact' => 'static_pages#contact'
get 'resume' => 'static_pages#resume'
get 'signup' => 'users#new'
resources :users
end