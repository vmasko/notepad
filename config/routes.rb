Notepad::Application.routes.draw do

	resources :users
	
	resources :pads do
		resources :notes, :only => [:new, :create, :destroy]
	end

	resources :sessions
	match 'pad_notes', :to => 'notes#create', :as => :notes
	match "/signup" => "users#new"
	match "/signin" => "sessions#new"
	match "/signout" => "sessions#destroy"

	root :to => "pads#index"

end
