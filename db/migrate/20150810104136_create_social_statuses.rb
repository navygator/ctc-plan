class CreateSocialStatuses < ActiveRecord::Migration
  def change
    create_table :social_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
