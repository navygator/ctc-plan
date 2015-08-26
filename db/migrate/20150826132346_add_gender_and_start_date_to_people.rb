class AddGenderAndStartDateToPeople < ActiveRecord::Migration
  def change
    add_column :people, :gender, :integer
    add_column :people, :start_at, :datetime
  end
end
