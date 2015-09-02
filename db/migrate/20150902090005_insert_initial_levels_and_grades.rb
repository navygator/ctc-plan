class InsertInitialLevelsAndGrades < ActiveRecord::Migration
  def change
    ['1 место', '2 место', '3 место', 'участие'].each do |name|
      Grade.create(name: name, achievement_type_id: AchievementType.first)
    end
    ['1-й разряд', '2-й разряд', '3-й разряд', '4-й разряд'].each do |name|
      Grade.create(name: name, achievement_type_id: AchievementType.where('name like ?', '%разряд%').first)
    end
    ['1-й класс'].each do |name|
      Grade.create(name: name, achievement_type_id: AchievementType.where('name like ?', '%класс%').first)
    end
  end
end
