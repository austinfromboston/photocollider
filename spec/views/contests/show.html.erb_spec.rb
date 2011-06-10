require 'spec_helper'

describe "contests/show.html.erb" do
  before(:each) do
    @contest = assign(:contest, stub_model(Contest,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
