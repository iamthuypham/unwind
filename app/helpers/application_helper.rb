module ApplicationHelper
  def form_group_tag(errors, &block)
     css_class = 'form-group'
     css_class << ' has-error' if errors.any?

     content_tag :div, capture(&block), class: css_class
  end
  
  def hotels_as_json(hotel_list) 
    hotel_list.collect do |hotel|
      { :name => hotel['name'],
        :address => hotel['address'],
        :hotelGuestRating => hotel['hotelGuestRating'],
        :lowRate => hotel['lowRate']
      }
    end.to_json
  end
end
