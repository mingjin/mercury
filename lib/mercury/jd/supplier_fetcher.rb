class SupplierFetcher
  
  def fetch_mobile_link link, category = '手机'
    @browser.navigate.to link
    
    div = @browser.find_elements(:css, '.category-item')[1]
    anchor = div.find_element(:css, 'div.mc div.items dl dd a')
    
    protocol_prefix = anchor.attribute('href').start_with?('//') ? 'http:' : ''
    
    link_href = protocol_prefix.concat anchor.attribute('href')
    link_href if anchor.text.eql? category
    
    link_href
  end
  
  def fetch_mobile_merchants link, category = '手机'
    @browser.navigate.to link
    
    @browser.find_element(:css, 'a.sl-e-more.J_extMore').click
    sleep 0.5
    merchants = @browser.find_elements(:css, 'ul#brandsArea li a').map {|anchor| anchor.attribute('title')}
    
    merchants
  end
  
  def browser _browser
    @browser = _browser
  end
end