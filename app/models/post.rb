class Post < ActiveRecord::Base
  belongs_to :user
  default_scope {order("created_at desc")}

  has_attached_file :image

  def self.from_users_followed_by(user)
    followed_user_ids = user.follows.map(&:followable_id)
    where(user_id: followed_user_ids)
  end
end
