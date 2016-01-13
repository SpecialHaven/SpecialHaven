class Post < ActiveRecord::Base
  actable
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
  validates :user_id, presence: true
  has_many :likes
  has_many :liked_by, through: :likes, source: :user

  def liked_by?(user)
  	Like.exists?(user: user, post: self)
  end

end
