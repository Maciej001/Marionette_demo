class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index

  	@user = User.first # just assumption
  	gon.rabl template: "app/views/users/show.json.rabl", as: "current_user"

  end
  
end
