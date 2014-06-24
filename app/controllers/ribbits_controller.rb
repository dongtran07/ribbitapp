class RibbitsController < ApplicationController
	def index
    @ribbits = Ribbit.all include: :user
    @ribbit = Ribbit.new
	end
	def create
	  @ribbit = Ribbit.new(ribbit_params)
	  @ribbit.user_id = current_user.id
	 
	  if @ribbit.save
	      redirect_to current_user
	  else
	      flash[:error] = "Problem!"
	      redirect_to current_user
	  end
	end
	def ribbit_params
		params.require(:ribbit).permit(:content,:user_id)
	end
end
