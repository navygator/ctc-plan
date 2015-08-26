class AddSchoolIdAgeCategoryIdToPeople < ActiveRecord::Migration
  def change
    add_column :people, :school_id, :integer
    add_column :people, :age_category_id, :integer
  end
end
