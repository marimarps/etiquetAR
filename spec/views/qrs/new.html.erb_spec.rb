require 'spec_helper'

describe "qrs/new" do
  before(:each) do
    assign(:qr, stub_model(Qr,
      :default_resource => "MyString"
    ).as_new_record)
  end

  it "renders new qr form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => qrs_path, :method => "post" do
      assert_select "input#qr_default_resource", :name => "qr[default_resource]"
    end
  end
end
