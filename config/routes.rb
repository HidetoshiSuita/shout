Rails.application.routes.draw do

  resources :follow_lists
  resources :shout_lists
  devise_for :users

  root to: "home#index"

  get 'home/index'

  get 'home/show'

  get 'after_log_in_prosess/chose' =>'after_log_in_prosess#chose'

  get 'after_log_in_prosess/shout' =>  'after_log_in_prosess#shout'

  get 'after_log_in_prosess/watch_shout' => 'after_log_in_prosess#watch_shout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'after_log_in_prosess/find_user' => 'after_log_in_prosess#find_user'

  get 'after_log_in_prosess/find_user_result' => 'after_log_in_prosess#find_user_result'

  get 'after_log_in_prosess/resp_shout/:id' => 'after_log_in_prosess#resp_shout'

  post 'after_log_in_prosess/resp_shout' => 'after_log_in_prosess#register_resp'

  get 'after_log_in_prosess/register_resp' => 'after_log_in_prosess#watch_shout'

  get 'after_log_in_prosess/watch_resp_shout/:id' => 'after_log_in_prosess#watch_resp_shout'

  get 'after_log_in_prosess/watch_resp_shout/resp_shout/:id' => 'after_log_in_prosess#resp_shout'

  get 'after_log_in_prosess/find_user_detail/:id' => 'after_log_in_prosess#find_user_detail'
end
