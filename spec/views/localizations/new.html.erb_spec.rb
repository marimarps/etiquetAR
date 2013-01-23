require 'spec_helper'

describe "localizations/new" do
  before(:each) do
    assign(:localization, stub_model(Localization,
      :address => "MyString",
      :gmaps => false,
      :latitude => 1.5,
      :longitude => 1.5
    ).as_new_record)
  end

  it "renders new localization form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => localizations_path, :method => "post" do
      assert_select "input#localization_address", :name => "localization[address]"
      assert_select "input#localization_gmaps", :name => "localization[gmaps]"
      assert_select "input#localization_latitude", :name => "localization[latitude]"
      assert_select "input#localization_longitude", :name => "localization[longitude]"
    end
  end
end
