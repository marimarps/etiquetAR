require 'spec_helper'

describe "qrs/edit" do
  before(:each) do
    @qr = assign(:qr, stub_model(Qr,
      :default_resource => "MyString"
    ))
  end

  it "renders the edit qr form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => qrs_path(@qr), :method => "post" do
      assert_select "input#qr_default_resource", :name => "qr[default_resource]"
    end
  end
end
