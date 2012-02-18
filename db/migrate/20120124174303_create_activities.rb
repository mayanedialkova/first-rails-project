class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :units
      t.string :integer

      t.timestamps
    end
  end
end
