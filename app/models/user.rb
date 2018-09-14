class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_one_attached :avatar

  has_many :spoken_languages, dependent:   :destroy
  has_many :languages, through: :spoken_languages
  has_many :wanted_languages, dependent:   :destroy
  has_many :languages, through: :wanted_languages
  has_and_belongs_to_many :interests, dependent:   :destroy
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :postal_code, length: { is: 5 }, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :birthdate, presence: true
  validates :bio, presence: true


# live chat association
  has_many :messages
  has_many :subscriptions
  has_many :chats, through: :subscriptions
  has_many :notifications

  def existing_chats_users
    existing_chat_users = []
    self.chats.each do |chat|
      existing_chat_users.concat(chat.subscriptions.where.not(user_id: self.id).map {|subscription| subscription.user})
    end
    existing_chat_users.uniq
  end

 # Follows a user.
  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  # Returns true if the current user is followed by  the other user.
  def followers?(other_user)
    followers.include?(other_user)
  end

  # Returns true if user1 and user are matching, user1 and user2 follow each other
  def self.match?(user1, user2)
    user1.following.include?(user2) && user2.following.include?(user1)
  end

end
