class AddStatusTypeIdToSocialStatuses < ActiveRecord::Migration
  def change
    add_column :social_statuses, :status_type_id, :integer
  end
end
