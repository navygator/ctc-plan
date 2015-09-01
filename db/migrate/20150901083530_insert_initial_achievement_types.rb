class InsertInitialAchievementTypes < ActiveRecord::Migration
  def change
    ['Участие в конкурсах', 'Стипендиат', 'Спортивный разряд', 'Спортивный класс'].each do |n|
      AchievementType.create(name: n)
    end
  end
end
