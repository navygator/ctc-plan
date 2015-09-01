class AddVisibleParamsToAchievementTypes < ActiveRecord::Migration
  def change
    add_column :achievement_types, :visible_params, :string
  end
end
