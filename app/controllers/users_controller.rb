class UsersController < ApplicationController
	def show
		@user = User.find_by(id: params[:id])
		
	end
  def new
  	@user = User.new
  end
  def create
  	@user = User.new(user_params)    #not the final implementation
  	if @user.save
  		#handle a successfl save
  	else 
  		render 'new'
end
end
private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :passwor_confirmation)
  end
end
