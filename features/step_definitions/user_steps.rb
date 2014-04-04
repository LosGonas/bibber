Given(/^I am on the user creation page$/) do
  visit "/register"
end

Given(/^I have entered username and password$/) do
  fill_in("Username", :with => 'testaus')
  fill_in("Password", :with => 'testaus')
end

When(/^I click Create User$/) do
  click_button("Create User")
end

Then(/^I should see User was successfully created\.$/) do
  expect(page).to have_content 'User was successfully created'
end

Given(/^I am on the login page$/) do
  visit "/login"
  @user = User.create!(
      :username => 'test',
      :password => 'test',
  )
end

Given(/^I have entered a valid username and password$/) do
  fill_in("Username", :with => 'test')
  fill_in("Password", :with => 'test')
end

When(/^I click Login$/) do
  click_button("Login")
end

Then(/^I should see Logged in$/) do
  expect(page).to have_content 'Logged in'
end

Given(/^I am logged in as a user$/) do
  visit "/login"
  @user = User.create!(
      :username => 'test',
      :password => 'test',
  )
  fill_in("Username", :with => 'test')
  fill_in("Password", :with => 'test')
  click_button("Login")
end

When(/^I click Logout$/) do
  click_link "Logout"
end

Then(/^I should see Logged out$/) do
  expect(page).to have_content 'Logged out'
end