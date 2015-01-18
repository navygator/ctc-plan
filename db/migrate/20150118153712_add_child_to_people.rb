class AddChildToPeople < ActiveRecord::Migration
  def change
    add_column :people, :child, :boolean, default: false
  end
end
