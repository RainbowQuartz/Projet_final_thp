class LanguagesController < ApplicationController
  def edit
    @language = Language
    @wanted_languages = WantedLanguage.new
    @spoken_languages = SpokenLanguage.new
    @user = current_user
  end

  def create
    p params

    params[:wanted_languages][:id].each do |wanted_language|
      p wanted_language
      if !wanted_language.empty?
        current_user.wanted_languages.create(:language_id => wanted_language)
      end
    end

    params[:spoken_languages][:id].each do |spoken_language|
      p spoken_language
      if !spoken_language.empty?
        current_user.spoken_languages.create(:language_id => spoken_language)
      end
    end

    redirect_to root_path
  end
end
