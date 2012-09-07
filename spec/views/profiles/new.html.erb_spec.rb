require 'spec_helper'

describe "profiles/new" do
  before(:each) do
    assign(:profile, stub_model(Profile).as_new_record)
  end

  it "renders new profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => profiles_path, :method => "post" do
    end
  end
end
