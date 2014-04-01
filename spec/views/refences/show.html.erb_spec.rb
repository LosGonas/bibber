require 'spec_helper'

describe "refences/show" do
  before(:each) do
    @refence = assign(:refence, stub_model(Refence))
  end

  it "renders attributes in <p>" do
    render
  end
end
