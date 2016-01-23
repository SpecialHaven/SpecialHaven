class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true

  default_scope -> { order('created_at ASC') }

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user
  has_many :comment_likes
  has_many :liked_by, through: :comment_likes, source: :user

  def liked_by?(user)
  	CommentLike.exists?(user: user, comment: self)
  end

end
