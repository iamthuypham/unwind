module ApplicationHelper
  def form_group_tag(errors, &block)
     css_class = 'form-group'
     css_class << ' has-error' if errors.any?

     content_tag :div, capture(&block), class: css_class
  end
  
  def event_info
    @event = Event.find(params[:id])
    @event.geocode
    @lat = @event.latitude
    @lng = @event.longitude
    @check_in_date = @event.startdate.strftime('%Y-%m-%d').to_s
    @event.enddate == @check_in_date ? @check_out_date = @event.startdate.tomorrow.strftime('%Y-%m-%d').to_s : @check_out_date =@event.enddate.strftime('%Y-%m-%d').to_s
  end
  
  #RESOURCE API
  #1 Hotel Resource - using Expedia API
  def hotels_as_json(hotel_list) 
    #Get Event Info first
    event_info
    
    #Using Event Info to retrieve Expedia resources
    expedia = Expedia.new(@lat, @lng, @check_in_date, @check_out_date )
    hotel_list = expedia.hotel_search["hotelList"]
    
    a = hotel_list.collect do |hotel|
      { :name => hotel['name'],
        :address => hotel['address'],
        :hotelGuestRating => hotel['hotelGuestRating'],
        :lowRate => hotel['lowRate']
      }
    end
  end
  
  #2 Weather Resource - using Forecast.io
end
