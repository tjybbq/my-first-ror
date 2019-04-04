Rails.application.routes.draw do
  root 'demo#print'

  get 'demo/index'
  get 'demo/print'
  # match 'demo/print' to: 'demo#print' via: ':get'
  # get ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
