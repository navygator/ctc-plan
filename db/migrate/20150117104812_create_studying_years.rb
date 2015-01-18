class CreateStudyingYears < ActiveRecord::Migration
  def change
    create_table :studying_years do |t|
      t.string :name

      t.timestamps
    end
  end
end
