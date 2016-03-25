class Going < ActiveRecord::Base

  belongs_to :task
  belongs_to :user
  has_many   :comments, ->{ order("created_at DESC")}
  has_many   :going_checks
  has_one    :feed_content, as: :content, dependent: :destroy

  after_create :create_feed_content
  after_update :update_feed_content

  validates_presence_of :user_id, :task_id, :text

  private
  def create_feed_content
    self.feed_content = FeedContent.create(user_id: user_id, updated_at: updated_at)
  end

  def update_feed_content
    self.feed_content.update(updated_at: updated_at)
  end

end
