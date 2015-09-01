class AddLevelIdGradeIdToAchievements < ActiveRecord::Migration
  def change
    add_column :achievements, :level_id, :integer
    add_column :achievements, :grade_id, :integer
  end
end
