class CreateTeacher < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
    end
  end
end
