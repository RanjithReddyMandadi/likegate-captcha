SampleKoalaRailsApp::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.



  root :to => 'home#index'
  get "liked" => "home#liked"
  match 'home/callback' => 'home#callback'

end
