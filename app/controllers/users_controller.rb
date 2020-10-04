class UsersController < ApplicationController

	before_action :authenticate_user!

	def index
		@users = User.all
		@book = Book.new
	end

	def show
		@user = User.find(params[:id])
		@books = Book.where(user_id: @user)
		@book = Book.new
	end

	def edit
		@user = User.find(params[:id])
		if @user.id = current_user.id
			render :edit
		else
			redirect_to users_path
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user), notice: "You have updated user successfully."
		else
			render :edit
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end
end
