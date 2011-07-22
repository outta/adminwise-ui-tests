# begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end 

Given /^I am on Home Page$/ do
  begin;  @browser.link(:text, "Logout").click; rescue => e; end
  @browser.goto($base_url)
  @home_page = HomePage.new(@browser)
end

Given /^I have entered userame admin on login page$/ do #|username|
  @home_page.enter_login("admin")
end

Given /^I have entered password test on login page$/ do #|password|
  @home_page.enter_password("test")
end

Given /^I have entered password badpass on login page$/ do #|password|
  @home_page.enter_password("badpass")
end

Given /^I have entered userame bob on login page$/ do #|username|
  @home_page.enter_login("bob")
end

When /^I press '([^"]*)' button$/ do |button_name|
  if button_name == 'Log in'
    @home_page.click_login
  end 
end

Then /^the text (.*) should be on the screen$/ do |message|
  # @browser.text.include?(message).should be_true
  assert(@browser.text.include?(message))
end
