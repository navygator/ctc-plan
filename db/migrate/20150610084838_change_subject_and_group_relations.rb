class ChangeSubjectAndGroupRelations < ActiveRecord::Migration
  def change
    remove_column :subjects, :union_id
    remove_column :groups, :section_id
    remove_column :groups, :student_id
    
    add_column :groups, :groupable_id, :integer
    add_column :groups, :groupable_type, :string
  end
end
