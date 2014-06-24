class RelationshipsController < ApplicationController
	def create
		@relationship = Relationship.new
		@relationship.flowed_id = params[:flowed_id]
		@relationship.flower_id = current_user.id
		if @relationship.save
			redirect_to User.find(params[:flowed_id])
		else
			flash[:error]="Couldn't follow!"
			redirect_to root_url
		end
	end
	def destroy
	    @relationship = Relationship.find(params[:id])
	    @relationship.destroy
	    redirect_to user_path params[:id]
	end
end