class Group < ActiveRecord::Base
  belongs_to :groupable, polymorphic: true
  belongs_to :subject
  belongs_to :time_of_day
  
  validates :subject_id, presence: true
  
end
