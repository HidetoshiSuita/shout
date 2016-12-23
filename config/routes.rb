Rails.application.routes.draw do
<<<<<<< HEAD
  resources :shout_lists
  devise_for :users
  get 'home/index'

  get 'home/show'

  get 'after_log_in_prosess/chose' =>'after_log_in_prosess#chose'

  get 'after_log_in_prosess/shout' =>  'after_log_in_prosess#shout'

  get 'after_log_in_prosess/watch_shout' => 'after_log_in_prosess#watch_shout'


=======
  get 'pages/index'

  get 'pages/show'

  root 'pages#index'
  get 'pages/show'
　#↑deviseの指定設定
>>>>>>> a387064bf2cbbc7c395db7f6049cd2b21a47f9f4
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root to: "home#index"
end
