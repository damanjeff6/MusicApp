MusicApp::Application.routes.draw do
  resources :users, :only => [:new, :create]
  resource :session

end
