Rails.application.routes.draw do
  root 'messages#index'
  post 'messages/create'
  post 'messages/check_number'
end
