class UsersController < ApplicationController
	def update
		@user = current_user
		if @user.avatar.attached?
			@user.avatar.purge
		end
		@user.avatar.attach(params.require(:user)[:avatar])
    redirect_to root_path
  end
end