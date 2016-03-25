class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :task
  belongs_to :going
  has_one    :feed_content, as: :content, dependent: :destroy

  after_create :create_feed_content
  after_update :update_feed_content

  validates_presence_of :going_id, :text

  private
  def create_feed_content
    self.feed_content = FeedContent.create(user_id: user_id, updated_at: updated_at)
  end

  def update_feed_content
    self.feed_content.update(updated_at: updated_at)
  end

end
