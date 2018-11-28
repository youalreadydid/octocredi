Rails.application.routes.draw do
  get '/', to: 'octocredi#index'
  get '/repos', to: 'octocredi#repos'
end
