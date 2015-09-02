class Grade < ActiveRecord::Base
  belongs_to :achievement_type
  has_many :achievements
end
