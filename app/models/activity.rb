class Activity < ActiveRecord::Base
  #attr_accessible :activity_id, :activity_name
  has_many :training_parts

  def name_and_units
    name + ' (' + units + ')'
  end
  
  def last_months
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    first_month = Time.now.month
    months.rotate(first_month)
  end
  
  def last_days
    days = []
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    (1..31).each do |x| 
      date = Time.now - 31.days + x.days
      label = date.day
      label = date.day.to_s + ' ' + months[date.month - 1][0,3] if date.day === 1
      days << label
    end
    
    days
  end
  
  def data_per_months #връща масив от месечните стойности за съответната дейност за последната 1 година
    #time_range = (Time.now.midnight - 1.year + 1.day)..Time.now.midnight
    #training_parts_last_year = TrainingPart.joins(:training, :activity).where(:trainings => {:date => time_range}, :activities => {:id => id} )

    monthly_values = []
    start_date = Time.now.midnight - 1.year + 1.day
    (1..12).each do |x|
      time_range = (start_date + (x-1).month)..(start_date + x.month)
      training_parts_month = TrainingPart.joins(:training, :activity).where(:trainings => {:date => time_range}, :activities => {:id => id} )
      monthly_values << training_parts_month.map(&:amount).inject(0,:+) 
    end
    
    monthly_values
  end
  
  def data_per_days
    daily_values = []
    start_date = Time.now.midnight - 1.month + 1.day
    
    (1..31).each do |x|
      time_range = (start_date + (x-1).day)..(start_date + x.day)
      training_parts_day = TrainingPart.joins(:training, :activity).where(:trainings => {:date => time_range}, :activities => {:id => id} )
      daily_values << training_parts_day.map(&:amount).inject(0,:+) 
    end
    
    daily_values
  end
end
