class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :child_id
      t.integer :group_id
    end
  end
end
