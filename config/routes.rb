Rails.application.routes.draw do
  
  get '/ufs/:date', to: 'ufs#daily'
  get '/client/:client', to: 'ufs#stats'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
