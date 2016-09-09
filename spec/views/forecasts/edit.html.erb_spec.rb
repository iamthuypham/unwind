require 'rails_helper'

RSpec.describe "forecasts/edit", type: :view do
  before(:each) do
    @forecast = assign(:forecast, Forecast.create!(
      :lat => 1.5,
      :lng => 1.5
    ))
  end

  it "renders the edit forecast form" do
    render

    assert_select "form[action=?][method=?]", forecast_path(@forecast), "post" do

      assert_select "input#forecast_lat[name=?]", "forecast[lat]"

      assert_select "input#forecast_lng[name=?]", "forecast[lng]"
    end
  end
end
