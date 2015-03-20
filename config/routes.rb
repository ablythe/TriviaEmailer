Rails.application.routes.draw do
  devise_for :users
  
  get 'listen' => 'weeks#listen'
end
