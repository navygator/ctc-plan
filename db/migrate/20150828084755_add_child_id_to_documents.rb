class AddChildIdToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :child_id, :integer
  end
end
