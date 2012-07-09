require 'spec_helper'

describe "qr_codes/index" do
  before(:each) do
    assign(:qr_codes, [
      stub_model(QrCode,
        :default_resource => "Default Resource"
      ),
      stub_model(QrCode,
        :default_resource => "Default Resource"
      )
    ])
  end

  it "renders a list of qr_codes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Default Resource".to_s, :count => 2
  end
end
