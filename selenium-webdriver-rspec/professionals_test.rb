load File.dirname(__FILE__) + '/test_helper.rb'

describe "Professionals" do
  include TestHelper

  before(:all) do
    @driver = Selenium::WebDriver.for(browser_type) 
    @driver.navigate.to($ITEST2_PROJECT_BASE_URL || $BASE_URL)
    reset_database
    fail_safe{ logout }
    login_as("admin")
  end

  before(:each) do
   @driver.find_element(:link_text, "ADMINISTRATION").click
   @driver.find_element(:link_text, "Professionals").click
  end
    
  after(:all) do
    fail_safe { logout } unless debugging?
    @driver.quit unless debugging?
  end

  it "[496] Admin User can add a professional" do
    @driver.find_element(:link_text, "New Professional").click
    new_professional_page = NewProfessionalPage.new(@driver)
    new_professional_page.select_category("Centre Based Early Intervention Programs")
    new_professional_page.enter_principal_name("Jane Steel")
    new_professional_page.enter_contact("Jenny")
    new_professional_page.enter_organisation_name("Focus Speech")
    new_professional_page.click_create
    try(10) { @driver.page_source.should include("Professionals List") }
    @driver.page_source.should include("Jane Steel")
  end
  
  it "[497] Admin user sort professional by category" do
    @driver.find_element(:link_text, "CATEGORY").click # NOTEs [Watir]  'Category' 
    try(3) { @driver.find_element(:id, "category_0").text.should == "Speech Pathlogists" }
    @driver.find_element(:link_text, "CATEGORY").click  
    try(3) { @driver.find_element(:id, "category_0").text.should == "Auditory Integration Training" }
  end
  
end
