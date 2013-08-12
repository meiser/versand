class SessionsController < Devise::SessionsController

	respond_to :json

	skip_before_filter :verify_authenticity_token
	
	def create
		self.resource = warden.authenticate!(auth_options)
		set_flash_message(:notice, :signed_in) if is_navigational_format?
		sign_in(resource_name, resource)
	
		#Meiser.foreach_baan("select t_drbez, t_drcd from twhmei005120") do |pr|
		#Meiser.foreach_baan("select t_stdr from twhmei004120 where t_nama = ?",[120]) do |pr|
		# puts pr
		#end
		
		#Meiser.foreach_baan("select t_stdr from twhmei004120 where t_nama = ?",[120]) do |pr|
		# puts pr
		#end
		
		#Meiser.foreach_baan("select FIRST 2000 ttdgro401120.t_corn from ttdgro401120") do |pr|
		# pr
		#end
		respond_to do |format|
				format.json do
					render :json => resource.authentication_token.to_json
				end
		end
		#data = {}
		#my_token = resource.authentication_token
		#render :json => my_token
		#respond_with resource #render => resource.authentication_token
		#respond_with resource, :location => after_sign_in_path_for(resource)
	end
	
	def destroy
		if current_user
			current_user.authentication_token = nil
			current_user.save
		end
		super
	end
	
	protected
	
	def verified_request?
		request.content_type == "application/json" || super
	end

end