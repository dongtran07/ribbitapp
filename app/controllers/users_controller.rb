class UsersController < ApplicationController
	def index
		@users= User.all
	end
	def new
    if current_user
        redirect_to buddies_path
    else
        @user = User.new
    end
	end
	def create
		@user= User.new(user_params)
		if @user.save
			redirect_to @user, notice:"Thank for signing up for Ribbit!"
		else
			render 'new'
		end
	end
	def show
		@user= User.find(params[:id])
		@ribbit = Ribbit.new
		@relationship = Relationship.where(
	    flower_id: current_user.id,
	    flowed_id: @user.id
		).first_or_initialize if current_user
	end
	def buddies
		if current_user
			@ribbit= Ribbit.new;
			buddies_id = current_user.floweds.map(&:id).push(current_user.id)
			@ribbits = Ribbit.find_all_by_user_id buddies_id
		else
			redirect_to root_url
		end
	end

	private 
    def user_params
      params.require(:user).permit(:email,:username,:name,:password,:password_confirmation)
    end
end
