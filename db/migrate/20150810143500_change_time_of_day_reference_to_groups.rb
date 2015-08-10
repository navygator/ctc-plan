class ChangeTimeOfDayReferenceToGroups < ActiveRecord::Migration
  def change
    remove_column :groups, :timeofday
    add_column :groups, :time_of_day_id, :integer
  end
end
