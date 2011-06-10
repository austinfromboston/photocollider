require 'spec_helper'

describe "contests/edit.html.erb" do
  before(:each) do
    @contest = assign(:contest, stub_model(Contest,
      :name => "MyString"
    ))
  end

  it "renders the edit contest form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => contests_path(@contest), :method => "post" do
      assert_select "input#contest_name", :name => "contest[name]"
    end
  end
end
