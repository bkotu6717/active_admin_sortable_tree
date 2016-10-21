class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_paper_trail_whodunnit

  	def user_for_paper_trail
    	admin_user_signed_in? ? current_admin_user.try(:id) : 'Unknown user'
  	end
end
