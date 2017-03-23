Rails.application.routes.draw do
  post '/messenger', to: 'assistant#messenger'
end
