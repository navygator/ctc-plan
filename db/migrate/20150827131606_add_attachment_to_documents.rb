class AddAttachmentToDocuments < ActiveRecord::Migration
  def up
    add_attachment :documents, :scan
  end

  def down
    remove_attachment :documents, :scan
  end
end
