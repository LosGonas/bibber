require 'spec_helper'

describe "refences/new" do
  before(:each) do
    assign(:refence, stub_model(Refence).as_new_record)
  end

  it "renders new refence form" do
    render

    assert_select "form[action=?][method=?]", refences_path, "post" do
    end
  end
end
