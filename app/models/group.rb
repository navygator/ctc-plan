class Group < ActiveRecord::Base
  belongs_to :groupable, polymorphic: true
  belongs_to :subject
  
  validates :subject_id, presence: true
  
end
