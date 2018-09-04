class UsersController < ApplicationController

	def update
		@user = current_user
		if @user.avatar.attached?
			@user.avatar.purge
		end
		@user.avatar.attach(params.require(:user)[:avatar])
    redirect_to user_path(current_user.id)
  end
end