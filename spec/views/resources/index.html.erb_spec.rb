require 'spec_helper'

describe "resources/index" do
  before(:each) do
    assign(:resources, [
      stub_model(Resource,
        :name => "Name",
        :uri => "Uri",
        :type => "Type",
        :image_location => "Image Location"
      ),
      stub_model(Resource,
        :name => "Name",
        :uri => "Uri",
        :type => "Type",
        :image_location => "Image Location"
      )
    ])
  end

  it "renders a list of resources" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Uri".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Image Location".to_s, :count => 2
  end
end
