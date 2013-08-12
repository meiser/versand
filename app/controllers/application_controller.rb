class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end
  
  respond_to :json, :only => :task
  
  protect_from_forgery
  
  before_filter :authenticate_user!
  
  def start
	#render :text => 'Startseite'
  end
  
  def after_sign_in_path_for(resource)
   "/info"
  end
  
end
