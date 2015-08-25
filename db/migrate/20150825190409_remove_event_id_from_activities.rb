class RemoveEventIdFromActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :event_id, :integer
  end
end
