require 'nokogiri'
require 'open-uri'

class SupplierFetcher
  
  def fetch_mobile_link link, category
    page = Nokogiri::HTML(open(link))
    link = page.css('.category-item')[1].css('div.mc div.items dl dd a')[0]
    link_protocol = link['href'].start_with?('//') ? 'http:' : ''
    
    link_protocol.concat link['href'] if link.text == category
  end
  
  def fetch_mobile_merchants link, category
    page = Nokogiri::HTML(open(link))
    page.css('#brandsArea li a').map {|anchor| anchor['title']}
  end
end