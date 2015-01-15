class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :department_id
      t.datetime :started_at
      t.datetime :closed_at

      t.timestamps
    end
  end
end
