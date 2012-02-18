class ChangeTrainingsTable < ActiveRecord::Migration
  def up
    change_table :trainings do |t|
      t.remove :km, :activity
      t.datetime :date
      t.text :about  
    end	    
  end

  def down
    drop_table "trainings"	  
  end
end
