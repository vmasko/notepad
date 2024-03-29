Notepad::Application.routes.draw do

	resources :users
	
	resources :pads do
		resources :notes
	end

	resources :sessions
	
	post 'pad_notes/:pad_id/notes(.:format)', :to => 'notes#create', :as => :notes
	
	match "/signup" => "users#new"
	match "/signin" => "sessions#new"
	match "/signout" => "sessions#destroy"

	root :to => "pads#index"

end
