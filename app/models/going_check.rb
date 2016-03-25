class GoingCheck < ActiveRecord::Base

  belongs_to :user
  belongs_to :task
  belongs_to :going

  validates :is_read, inclusion: {in:[true, false]}
  
end
