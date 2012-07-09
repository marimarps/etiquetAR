require 'spec_helper'

describe "qrs/show" do
  before(:each) do
    @qr = assign(:qr, stub_model(Qr,
      :default_resource => "Default Resource"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Default Resource/)
  end
end
