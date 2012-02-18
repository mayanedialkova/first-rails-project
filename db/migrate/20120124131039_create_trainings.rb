class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.integer :km
      t.string :activity
    end
  end
end
