class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  acts_as_follower
  acts_as_followable

  validates :username, presence: true, uniqueness: true

  def feed
    Post.from_users_followed_by(self)
  end
end
