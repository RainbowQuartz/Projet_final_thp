class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]
	def show
    @user = User.find(params[:id])
  end


  def update
		@user = current_user
		if @user.avatar.attached?
			@user.avatar.purge
		end
		@user.avatar.attach(params.require(:user)[:avatar])
    redirect_to root_path
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    #@users = @user.following.paginate(page: params[:page])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    #@users = @user.followers.paginate(page: params[:page])
    @users = @user.followers
    render 'show_follow'
  end

end