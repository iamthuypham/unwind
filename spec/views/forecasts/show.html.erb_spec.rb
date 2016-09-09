require 'rails_helper'

RSpec.describe "forecasts/show", type: :view do
  before(:each) do
    @forecast = assign(:forecast, Forecast.create!(
      :lat => 1.5,
      :lng => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
  end
end
