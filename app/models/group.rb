class Group < ActiveRecord::Base
  belongs_to :groupable, polymorphic: true
  belongs_to :subject
  belongs_to :time_of_day
  
  has_and_belongs_to_many :children

  validates :subject_id, presence: true
  
end
