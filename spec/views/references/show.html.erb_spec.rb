require 'spec_helper'

describe "references/show" do
  before(:each) do
    @reference = assign(:reference, stub_model(Reference))
  end

  it "renders attributes in <p>" do
    render
  end
end
