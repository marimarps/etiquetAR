require 'spec_helper'

describe "localizations/show" do
  before(:each) do
    @localization = assign(:localization, stub_model(Localization,
      :address => "Address",
      :gmaps => false,
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
    rendered.should match(/false/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
  end
end
