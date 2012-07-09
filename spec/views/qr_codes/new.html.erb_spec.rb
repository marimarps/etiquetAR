require 'spec_helper'

describe "qr_codes/new" do
  before(:each) do
    assign(:qr_code, stub_model(QrCode,
      :default_resource => "MyString"
    ).as_new_record)
  end

  it "renders new qr_code form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => qr_codes_path, :method => "post" do
      assert_select "input#qr_code_default_resource", :name => "qr_code[default_resource]"
    end
  end
end
