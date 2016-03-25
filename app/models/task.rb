class Task < ActiveRecord::Base

  belongs_to :user
  has_many   :goings, -> { order("created_at DESC")}
  has_many   :comments, dependent: :destroy
  has_many   :task_checks
  has_one    :feed_content, as: :content, dependent: :destroy

  after_create :create_feed_content
  after_update :update_feed_content

  validates_presence_of :user_id, :title, :detail

  private
  def create_feed_content
    self.feed_content = FeedContent.create(user_id: user_id, updated_at: updated_at)
  end
  
  def update_feed_content
    self.feed_content.update(updated_at: updated_at)
  end

end
