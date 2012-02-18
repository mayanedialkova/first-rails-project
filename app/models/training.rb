class Training < ActiveRecord::Base
  has_many :training_parts, :dependent => :destroy
  accepts_nested_attributes_for :training_parts, :reject_if => lambda { |x| x[:amount].blank? }, :allow_destroy => true
end
