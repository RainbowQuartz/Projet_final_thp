class InterestsController < ApplicationController
  ## GET interest/edit
  def edit
    @interest = Interest.first
    @user = User.find(current_user.id)
    @all_interests = Interest.all
    @interest_user = @user.interests.build

  end

  def update
    p params

    @user = current_user
    params[:interests][:id].each do |interest|
      if !interest.empty?
        @user.interests << Interest.find(interest)
      end
    end
    redirect_to root_path
  end
end
