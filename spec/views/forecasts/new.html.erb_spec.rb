require 'rails_helper'

RSpec.describe "forecasts/new", type: :view do
  before(:each) do
    assign(:forecast, Forecast.new(
      :lat => 1.5,
      :lng => 1.5
    ))
  end

  it "renders new forecast form" do
    render

    assert_select "form[action=?][method=?]", forecasts_path, "post" do

      assert_select "input#forecast_lat[name=?]", "forecast[lat]"

      assert_select "input#forecast_lng[name=?]", "forecast[lng]"
    end
  end
end
