require 'spec_helper'

describe "references/edit" do
  before(:each) do
    @reference = assign(:reference, stub_model(Reference))
  end

  it "renders the edit reference form" do
    render

    assert_select "form[action=?][method=?]", reference_path(@reference), "post" do
    end
  end
end
