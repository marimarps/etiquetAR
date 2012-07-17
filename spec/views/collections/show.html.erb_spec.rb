require 'spec_helper'

describe "collections/show" do
  before(:each) do
    @collection = assign(:collection, stub_model(Collection,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
