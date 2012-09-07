require 'spec_helper'

describe "profiles/edit" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile))
  end

  it "renders the edit profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => profiles_path(@profile), :method => "post" do
    end
  end
end
