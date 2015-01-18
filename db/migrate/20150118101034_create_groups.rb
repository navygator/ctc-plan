class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :section_id
      t.integer :subject_id
      t.integer :student_id
      t.string :timeofday

      t.timestamps
    end
  end
end
