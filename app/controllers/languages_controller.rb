class LanguagesController < ApplicationController
  def edit
    puts "======je rentre dans edit de language======"
    @language = Language
    @wanted_languages = WantedLanguage.new
    @spoken_languages = SpokenLanguage.new
    @user = current_user
  end

  def create
    puts "======je rentre dans create de language======"
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

    redirect_to current_user
  end
end
