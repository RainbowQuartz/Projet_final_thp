class UsersController < ApplicationController
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

    params[:interests][:id].each do |interest|
      if !interest.empty?
        @user.interests << Interest.find(interest)
      end
    end

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
    puts "======================"
    puts @users
    puts @users.inspect
    puts "======================"
  end

  def preferences
    @user = User.find(params[:id])
  end

  def langues
    @user = User.find(params[:id])
  end

 # private

  def list_match
    list = []
    User.all.each do |user|
      if User.match?(current_user, user) && user != current_user
      list << user
      end
     end
    return list
  end

end
