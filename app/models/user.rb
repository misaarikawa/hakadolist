class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :tasks, ->{ order("created_at DESC")}
  has_many :goings, ->{ order("created_at DESC")}
  has_many :comments, ->{ order("created_at DESC")}
  has_many :feed_contents, ->{ order("created_at DESC")}
  has_many :task_checks
  has_many :going_checks

  def name
    "#{family_name} #{first_name}"
  end

  def name_kana
    "#{family_name_kana} #{first_name_kana}"
  end

  def full_profile?
    avatar? && family_name? && first_name? && family_name_kana? && first_name_kana? && email? && unit? && job? && charge?
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_attached_file :avatar,
                     styles:  { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :avatar,
                                     content_type: ["image/jpg","image/jpeg","image/png"]
end
