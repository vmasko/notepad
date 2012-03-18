Notepad::Application.routes.draw do

	resources :users
	
	resources :pads do
		resources :notes
	end

	resources :sessions

	match "/signup" => "users#new"
	match "/signin" => "sessions#new"
	match "/signout" => "sessions#destroy"

	root :to => "pads#index"

end
