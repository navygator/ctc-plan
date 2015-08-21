class AddStatusesToPeople < ActiveRecord::Migration
  def change
    add_column :people, :person_status_id, :integer
    add_column :people, :family_status_id, :integer
  end
end
