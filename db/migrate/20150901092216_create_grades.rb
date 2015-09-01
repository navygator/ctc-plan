class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :achievement_type_id
      t.string :name

      t.timestamps
    end
  end
end
