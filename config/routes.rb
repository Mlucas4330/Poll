Rails.application.routes.draw do
  post '/poll' => 'polls#create', as: :poll

  root "polls#index"
end
