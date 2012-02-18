require 'spec_helper'

describe Activity do
  it "can be instantiated" do
    Activity.new.should be_an_instance_of(Activity)
  end

  it "can be saved successfully" do
    Activity.create.should be_persisted
  end
  
  it "has labels for last days" do
    @activity = Activity.new
    #@activity.last_days.should be_an_instance_of(Array)
    @activity.last_days.length.should == 31    
  end  
  
  it "has all 12 months" do
    @activity = Activity.new
    @activity.last_months.should include("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")
    @activity.last_months.length.should == 12    
  end
  
  it "has constructs name_and_units correctly" do
    activity = Activity.new
    activity.name = "name"
    activity.units = "units"
    activity.name_and_units.should === "name (units)"
  end 

=begin  
  describe Training do
    it "sums the amounts of its months" do
      training = Training.new
      training.date = Date.now
      activity = Activity.new
      
      activity.data_per_months.inject(0,:+).should eq 0
      activity.data_per_days.inject(0,:+).should eq 0
      
      training.add_entry(:training_part => TrainingPart.new(:item => Item.new(
        :amount => 100,
        :activity => activity
      )))
      training.add_entry(:training_part => TrainingPart.new(:item => Item.new(
        :amount => 50,
        :activity => activity
      )))
      
      #activity.data_per_months.inject(0,:+).should eq 150
      #activity.data_per_days.inject(0,:+).should eq 150
    end
  end
 
  it "sums the amounts of its days" do
    training = Training.new
    training.date = Date.now
    activity = Activity.new
    
    training.add_entry(:training_part => TrainingPart.new(:item => Item.new(
      :amount => 100,
      :activity => activity
    )))
    training.add_entry(:training_part => TrainingPart.new(:item => Item.new(
      :amount => 50,
      :activity => activity
    )))
    
    activity.data_per_days.inject(0,:+).should eq 150
  end 
=end
end
