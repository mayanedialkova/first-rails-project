class TrainingPart < ActiveRecord::Base
  belongs_to :activity
  belongs_to :training
  
  accepts_nested_attributes_for :activity, :allow_destroy => true
end
