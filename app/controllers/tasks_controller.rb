class TasksController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def execute
   #puts "################################################"
   #puts params
   #puts "################################################"
   
   if BAAN_QUERY[params[:name]].present?
    if BAAN_QUERY[params[:name]].starts_with?("select")
	 Meiser.foreach_baan(BAAN_QUERY[params[:name]],[100014099,"  3"]) do |pr|
	 	puts pr
	 end
	 render :json => "select".to_json
	else
	 #Meiser.update_baan(BAAN_QUERY[params[:name]]),[120])
	 render :json => "update or insert".to_json
	end
	
	
   else
    render :json => DateTime.now.to_json
   
   end
  end

end
