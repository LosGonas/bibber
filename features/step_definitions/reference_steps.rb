Given(/^I am on start page$/) do
  visit root_path
end

When(/^I click All references$/) do
  click_link "All references"
end

Then(/^I should see a list of all references in the system$/) do
  expect(page).to have_content "All References"
end

Given(/^I am on the all references page$/) do
  @article = Reference.create!(
      :entry_type => 'article',
      :entries => { :author => "testi", :title => "testaaja", :journal => "okei", :year => "2010" }
  )
  visit "/references"
end

Given(/^There are some references in the system$/) do
  expect(page).to have_content "article"
end

When(/^I click Show on a reference$/) do
  click_link "Show"
end

Then(/^I should see info about that reference$/) do
  expect(page).to have_content "UTF-8 BibTex"
end

Given(/^I am on the new page$/) do
  visit "/articles/new"
end

When(/^I fill the required fields$/) do
  fill_in("Author", :with => 'terve')
  fill_in("Title", :with => 'moi')
  fill_in("Journal", :with => 'hei')
  fill_in("Year", :with => '1999')
end

Then(/^I should see message of success$/) do
  click_button "Create Reference"
  expect(page).to have_content "SUCCESS"
end

Given(/^I am on all references page$/) do
  @article = Reference.create!(
      :entry_type => 'article',
      :entries => { :author => "testien", :title => "testaajaa", :journal => "okei", :year => "2010" }
  )
  visit "/references"
end

When(/^I click Edit on a reference$/) do
  click_link "Edit"
end

Then(/^I should be able to edit info$/) do
  expect(page).to have_content "Editing reference"
  fill_in("Author", :with => 'terve')
end

Then(/^save changes$/) do
  click_button "Update Reference"
  expect(page).to have_content "Reference was successfully updated"
end

When(/^I click Destroy$/) do
  visit "/references"
  click_link "Destroy"
end

Then(/^I should not see that reference$/) do
  expect(page).not_to have_content "UTF-8 BibTex"
end