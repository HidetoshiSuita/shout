Rails.application.routes.draw do

  resources :genres
  resources :like_lists
  resources :follow_lists
  resources :shout_lists
  devise_for :users, controllers: {registrations: "registrations"}
  
  
  get 'articles/articles_menu' => 'articles#articles_menu'
  get 'admin/admin_menu' => 'admin#admin_menu'
  get 'after_log_in_prosess/menu' =>'after_log_in_prosess#menu'
  root to: "after_log_in_prosess#menu"
  
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

  get 'after_log_in_prosess/find_user_detail/follow_user/:user_id/:follow_id' => 'after_log_in_prosess#follow_user'

  post 'after_log_in_prosess/find_user_detail/delete_follow_list/:id' => 'after_log_in_prosess#delete_follow_list'

  post '/after_log_in_prosess/make_like/:user_id/:shout_id' => 'after_log_in_prosess#make_like'

  post '/after_log_in_prosess/destroy_like_list/:user_id/:shout_id' => 'after_log_in_prosess#destroy_like_list'

  post'/after_log_in_prosess/find_user_detail/make_like/:user_id/:shout_id' => 'after_log_in_prosess#make_like'

  get "/after_log_in_prosess/watch_my_info/:id" => 'after_log_in_prosess#watch_my_info'
  
  get "/after_log_in_prosess/show_img" => 'after_log_in_prosess#show_img'
  
  get "/after_log_in_prosess/icon" => 'after_log_in_prosess#icon'

  get '/after_log_in_prosess/watch_follow_user/:id' => 'after_log_in_prosess#watch_follow_user'

  get '/after_log_in_prosess/watch_follower/:id' => 'after_log_in_prosess#watch_follower'

  get '/after_log_in_prosess/update_my_info/:id' => 'after_log_in_prosess#update_my_info'

  post '/after_log_in_prosess/action_update_my_info' => 'after_log_in_prosess#action_update_my_info'

  get '/after_log_in_prosess/remake_shout/:id' => 'after_log_in_prosess#remake_shout'

  post '/after_log_in_prosess/remake_shout' => 'after_log_in_prosess#update_shout'

  get '/after_log_in_prosess/remake_shout/destoroy_shout/:id' => 'after_log_in_prosess#destoroy_shout'

end
