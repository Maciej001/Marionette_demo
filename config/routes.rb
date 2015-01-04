Rails.application.routes.draw do
	resources :users
	resources :leads, only: [:index]
	
  root to: "application#index"
end
