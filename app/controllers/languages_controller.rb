class LanguagesController < ApplicationController
  def edit
    @wanted_languages = WantedLanguage.new
    @spoken_languages = SpokenLanguage.new
  end

  def update
  end
end
