require 'spec_helper'

describe "localizations/index" do
  before(:each) do
    assign(:localizations, [
      stub_model(Localization,
        :address => "Address",
        :gmaps => false,
        :latitude => 1.5,
        :longitude => 1.5
      ),
      stub_model(Localization,
        :address => "Address",
        :gmaps => false,
        :latitude => 1.5,
        :longitude => 1.5
      )
    ])
  end

  it "renders a list of localizations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
