require 'spec_helper'

describe "refences/index" do
  before(:each) do
    assign(:refences, [
      stub_model(Refence),
      stub_model(Refence)
    ])
  end

  it "renders a list of refences" do
    render
  end
end
