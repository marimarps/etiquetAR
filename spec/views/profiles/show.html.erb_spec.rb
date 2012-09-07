require 'spec_helper'

describe "profiles/show" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
