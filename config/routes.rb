Rails.application.routes.draw do
  resources :enemies
  resources :subjects, :path => 'vakken' do
    resources :tests do 
      resources :questions
      get 'results', to: 'tests#results'
    end
    resources :assignments 
    resources :glossaries do
      resources :timelines do
        resources :events
      end
      resources :concepts
    end
  end

  root 'subjects#index'
end
