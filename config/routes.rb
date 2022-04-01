Rails.application.routes.draw do
  root 'cycles#index'
  resources :invitations, only: [:new, :create] do
end
