class Event < ActiveRecord::Base
  belongs_to :user
  has_many  :activities, dependent: :destroy
  after_save :length?
  scope :visible_to, -> (user) { user ? all : where(@events.user = @user) }
  
  geocoded_by :location
  after_validation :geocode
  
  def self.weather(event)
    event.geocode
    lat = event.latitude
    lng = event.longitude
    time = event.startdate.to_time.iso8601
    @weather = ForecastIO.forecast(lat, lng, time: time)
  end
  
  def self.length?(event)
    event.startdate == event.enddate ? event.length = 'One Day' : event.length = 'Mutiple Days'
  end
end
