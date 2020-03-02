Rails.application.routes.draw do
  root to: 'greetings#index'
  get 'greetings', to: 'greetings#index'
end
