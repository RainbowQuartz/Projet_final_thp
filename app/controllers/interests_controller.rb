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
    params[:interests][:id].each do |interest|
      if !interest.empty?
        if !current_user.interests.ids.include?(interest.to_i)
          current_user.interests << Interest.find(interest)
        end
      end
    end
    redirect_to current_user
  end

  def delete
    p params[:interest_id]

    current_user.interests.delete(params[:interest_id])
    redirect_to current_user
  end
end
