require 'spec_helper'

describe "resources/show" do
  before(:each) do
    @resource = assign(:resource, stub_model(Resource,
      :name => "Name",
      :uri => "Uri",
      :type => "Type",
      :image_location => "Image Location"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Uri/)
    rendered.should match(/Type/)
    rendered.should match(/Image Location/)
  end
end
