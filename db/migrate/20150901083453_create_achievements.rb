class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :achievable_type
      t.integer :achievable_id
      t.integer :achievement_type_id
      t.text :description
      t.datetime :date

      t.timestamps
    end
  end
end
