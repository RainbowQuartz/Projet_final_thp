class UsersController < ApplicationController
  include ::ApplicationHelper
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]
	def show
    @user = User.find(params[:id])
  end


  def update
    puts params
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
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end


  def match
    @title = "Mes matchs"
    @user = User.find(params[:id])
    @users = list_match
  end

  def preferences
    @user = User.find(params[:id])
  end

  def langues
    @user = User.find(params[:id])
  end


 private



end
