class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :document_type_id

      t.timestamps
    end
  end
end
