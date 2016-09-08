require 'nokogiri'
require 'open-uri'

class SupplierFetcher
  
  def homepage
    page = Nokogiri::HTML(open("http://www.jd.com/allSort.aspx"))
    page.css('.category-item')[1].css('div.mc div.items dl dd a')[0].text
  end
end