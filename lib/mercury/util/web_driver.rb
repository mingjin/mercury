require 'selenium-webdriver'

class WebDriver
  def self.phantomjs
    browser :phantomjs
  end
  
  private 
  def self.browser driver
    begin
      Selenium::WebDriver.for driver
    rescue Error => e
      puts e
    end
  end
end