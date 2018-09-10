class StaticPagesController < ApplicationController
  before_action :suggestions, only: [:home]

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
      points = SuggestionAlgorithm.perform(current_user, compared_user)
      p '-' *20 + points.to_s + '-' * 20
      @comparisons_hash[compared_user.id] = points
    end
    p @comparisons_hash
  end
end
