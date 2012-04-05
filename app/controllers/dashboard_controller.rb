class DashboardController < ApplicationController
	check_authorization
	skip_authorization_check
  def index
  	if current_user.can? :view, :dashboard
  		
  	end
  end
end
