require 'spec_helper'

describe "qrs/index" do
  before(:each) do
    assign(:qrs, [
      stub_model(Qr,
        :default_resource => "Default Resource"
      ),
      stub_model(Qr,
        :default_resource => "Default Resource"
      )
    ])
  end

  it "renders a list of qrs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Default Resource".to_s, :count => 2
  end
end
