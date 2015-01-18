class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.datetime :birthday
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
