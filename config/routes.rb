Rails.application.routes.draw do
  get 'weathers/index'
  root 'weathers#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
