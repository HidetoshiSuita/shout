Rails.application.routes.draw do
  get 'pages/index'

  get 'pages/show'

  root 'pages#index'
  get 'pages/show'
　#↑deviseの指定設定
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
