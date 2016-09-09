require 'selenium-webdriver'

class SupplierFetcher
    
  def fetch_mobile_link link, category = '手机'
    browser = Selenium::WebDriver.for :phantomjs
    browser.navigate.to link
    
    div = browser.find_elements(:css, '.category-item')[1]
    link = div.find_element(:css, 'div.mc div.items dl dd a')
    
    protocol_prefix = link.attribute('href').start_with?('//') ? 'http:' : ''
    
    browser.quit
    
    link_href = protocol_prefix.concat link.attribute('href')
    link_href if link.text.eql? category
  end
  
  def fetch_mobile_merchants link, category = '手机'
    browser = Selenium::WebDriver.for :phantomjs
    browser.navigate.to link
    
    merchants = browser.find_elements(:css, 'ul#brandsArea li a').map do |anchor| 
      puts anchor
      anchor.attribute('title')
    end
    
    browser.quit
    
    merchants
  end
  
  
end