Rails.application.routes.draw do
 

  get 'password_resets/new'

  get 'password_resets/edit'

root 'static_pages#home'
get 'help' => 'static_pages#help'
get 'about' => 'static_pages#about'
get 'contact' => 'static_pages#contact'
get 'resume' => 'static_pages#resume'
get 'signup' => 'users#new'
get 'login' => 'sessions#new'
post 'login' => 'sessions#create'
delete 'logout' => 'sessions#destroy'

resources :users do
	member do 
		get :following, :followers
	end
end
resources :account_activations, only:   [:edit]
resources :password_resets,     except: [:index, :destroy]
resources :microposts,          only:   [:create, :destroy]
end