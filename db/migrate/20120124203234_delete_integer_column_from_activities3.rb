class DeleteIntegerColumnFromActivities3 < ActiveRecord::Migration
  def up
    remove_column :activities, :integer
  end

  def down
  end
end
