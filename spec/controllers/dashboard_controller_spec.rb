require 'spec_helper'

describe DashboardController do 
	describe "GET index" do
		it "should redirect anonymous users" do
			response.should redirect_to new_user_session_path
		end

	end
end