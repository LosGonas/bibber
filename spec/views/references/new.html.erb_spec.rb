require 'spec_helper'

describe "references/new" do
  before(:each) do
    assign(:reference, stub_model(Reference).as_new_record)
  end

=begin
  it "renders new reference form" do
    render

    assert_select "form[action=?][method=?]", references_path, "post" do
    end
  end
=end
end
