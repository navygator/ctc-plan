class CreateGroupUsers < ActiveRecord::Migration
  def change
    create_table :groups_people, id: false do |t|
      t.belongs_to :group, index: true
      t.belongs_to :child, index: true
      t.timestamps
    end
  end
end
