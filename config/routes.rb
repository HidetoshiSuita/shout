Rails.application.routes.draw do

  resources :shout_lists
  devise_for :users
  get 'home/index'

  get 'home/show'

  get 'after_log_in_prosess/chose' =>'after_log_in_prosess#chose'

  get 'after_log_in_prosess/shout' =>  'after_log_in_prosess#shout'

  get 'after_log_in_prosess/watch_shout' => 'after_log_in_prosess#watch_shout'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root to: "home#index"
end
