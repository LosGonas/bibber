require 'spec_helper'

describe "refences/edit" do
  before(:each) do
    @refence = assign(:refence, stub_model(Refence))
  end

  it "renders the edit refence form" do
    render

    assert_select "form[action=?][method=?]", refence_path(@refence), "post" do
    end
  end
end
