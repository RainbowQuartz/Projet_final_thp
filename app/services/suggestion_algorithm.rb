class SuggestionAlgorithm
  attr_accessor :match_points

  def calculate_match_points(user, compared_user)
    @spoken_languages  = user.spoken_languages
    @wanted_languages  = user.wanted_languages
    @interests         = user.interests
    @country           = user.country
    @city              = user.city
    @postal_code       = user.postal_code.to_s

      @match_points = 0
      compare_spoken_laguages(@spoken_languages, compared_user)
      compare_wanted_languages(@wanted_languages, compared_user)
      compare_countries(@country, compared_user)
      compare_cities(@city, compared_user)
      compare_postal_codes(@postal_code, compared_user)
      compare_interests(@interests, compared_user)
  end

  def compare_spoken_laguages(user_languages, compared_user)
    user_languages.each do |language|
      if compared_user.wanted_languages.include?(language)
        @match_points += 10
      end
    end
  end

  def compare_wanted_laguages(user_languages, compared_user)
    user_languages.each do |language|
      if compared_user.spoken_languages.include?(language)
        @match_points += 10
      end
    end
  end

  def compare_countries(user_country, compared_user)
    if compared_user.country == user_country
      @match_points += 2
    end
  end

  def compare_cities(user_city, compared_user)
    if compared_user.city == user_city
      @match_points += 8
    end
  end

  def compare_postal_codes(user_postal_code, compared_user)
    compared_user_postal_code = compared_user.postal_code.to_s
    a_first_digits = user_postal_code[0] + user_postal_code[1]
    a_last_digits = user_postal_code[2] + user_postal_code[3] + user_postal_code[4]
    b_first_digits = compared_user_postal_code[0] + compared_user_postal_code[1]
    b_last_digits = compared_user_postal_code[2] + compared_user_postal_code[3] + compared_user_postal_code[4]

    if a_first_digits == b_first_digits
      @match_points += 8
      if a_last_digits == b_lats_digits
        @match_points += 10
      end
    end
  end

  def compare_interests(user_interests, compared_user)
    user_interests.each do |interest|
      if compared_user.interests.include?(interest)
        @match_points += 3
      end
    end
  end

  def perform(user, compared_user)
    calculate_match_points(user, compared_user)
  end
end
