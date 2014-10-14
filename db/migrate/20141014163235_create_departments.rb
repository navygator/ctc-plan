class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.datetime :started_at
      t.datetime :closed_at

      t.timestamps
    end
  end
end
