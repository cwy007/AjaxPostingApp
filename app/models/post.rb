class Post < ApplicationRecord
  validates_presence_of :content
  belongs_to :user

  has_many :likes, :dependent => :destroy
  has_many :liked_users, :through => :likes, :source => :user

  def find_like(user)
    self.likes.where(:user_id == user.id).first
  end

  has_many :favorites, :dependent => :destroy
  has_many :favorited_users, :through => :favorites, :source => :user

  def find_favorite(user)
    self.favorites.where( :user_id == user.try(:id) ).first
  end

  belongs_to :category, :optional => true

  has_many :scores , :class_name => "PostScore"

  def find_score(user)
    user && self.scores.where( :user_id => user.id ).first
  end

  def average_score
    self.scores.average(:score)
  end

end
