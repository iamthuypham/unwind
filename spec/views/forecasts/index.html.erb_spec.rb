require 'rails_helper'

RSpec.describe "forecasts/index", type: :view do
  before(:each) do
    assign(:forecasts, [
      Forecast.create!(
        :lat => 1.5,
        :lng => 1.5
      ),
      Forecast.create!(
        :lat => 1.5,
        :lng => 1.5
      )
    ])
  end

  it "renders a list of forecasts" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
