class Activity < ActiveRecord::Base
  belongs_to :event
  after_save :date?
  
  def self.date?(activity)
    activity.event.length == 'One Day' ? activity.event.startdate : activity.date
  end
end
