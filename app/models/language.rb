class Language < ApplicationRecord
  has_many :spoken_languages
  has_many :users, through: :spoken_languages
  has_many :wanted_languages
  has_many :users, through: :wanted_languages
end
