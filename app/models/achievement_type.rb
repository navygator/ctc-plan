class AchievementType < ActiveRecord::Base
  has_many :grades
  has_many :achievements
end
