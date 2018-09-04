class User < ApplicationRecord
  has_many :spoken_languages
  has_many :languages, through: :spoken_languages
  has_many :wanted_languages
  has_many :languages, through: :wanted_languages
  has_and_belongs_to_many :interests

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :postal_code, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :birthdate, presence: true
  validates :bio, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
end
