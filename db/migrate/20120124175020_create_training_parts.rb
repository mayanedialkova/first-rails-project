class CreateTrainingParts < ActiveRecord::Migration
  def change
    create_table :training_parts do |t|
      t.integer :training_id
      t.integer :activity_id
      t.integer :amount

      t.timestamps
    end
  end
end
