class StaticPagesController < ApplicationController
  before_action suggestions, only: [:home]

  def home
  end

  def contact
  end

  def about
  end

  private

  def suggestions
    @comparisons_hash = {}
    User.all.each do |compared_user|
      SuggestionAlgorithm.perform(current_user, compared_user)
      @comparisons_hash[compared_user.id] = @match_points
    end
  end
end
