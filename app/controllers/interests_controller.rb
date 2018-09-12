class InterestsController < ApplicationController
  ## GET interest/edit
  def edit
    puts "===========je rentre dans edit d'interests============"
    @interest = Interest.first
    @user = current_user 
    @all_interests = Interest.all
    @interest_user = @user.interests.build    
  end

  def update
    puts "===========je rentre dans create d'interests============"
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
