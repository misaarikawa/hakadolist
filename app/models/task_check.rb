class TaskCheck < ActiveRecord::Base

  belongs_to :user
  belongs_to :task
  
  validates :is_read, inclusion: {in:[true, false]}
  
end
