require 'spec_helper'

describe SessionsController do

  let(:valid_attributes) { { "username" => "rspecc", "password" => "passu" } }
=begin

  describe "login creates a session" do
    it "assign user to session" do
      visit '/login'
        fill_in 'Username', :with => ""
        fill_in 'Password', :with => "user.password"

      click_link 'Login'
      expect(page).to have_content 'Success'
      end
    end
=end

end
