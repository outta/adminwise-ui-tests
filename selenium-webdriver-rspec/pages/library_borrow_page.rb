# load File.dirname(__FILE__) + '/maybe_your_template_page.rb'

class LibraryBorrowPage < AbstractPage

  def initialize(browser)
    super(browser, "") # <=
  end

  def click_find_member
    click_button("Find member")
  end
  
  def enter_resource(resource)
    @driver.find_element(:id, "resource_textbox_q").send_keys(resource)
  end

  def click_find_resource
    click_button("Find resource")
  end

  def click_select
    sleep 1
    @driver.find_element(:link_text, "Select").click
  end

  def click_process
    sleep 1
    click_button("Process")
  end

  def enter_member_name(name)
    @driver.find_element(:id, "member_textbox_q").send_keys(name)
  end

end