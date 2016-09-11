require 'selenium-webdriver'

describe SupplierFetcher do
  before(:all) do
    @fetcher = SupplierFetcher.new
    @browser = Selenium::WebDriver.for :phantomjs
    @fetcher.browser @browser
  end
  
  after(:all) do
    @browser.close
    @browser.quit
  end
  
  it "fetch mobile link" do
    mobile_link = @fetcher.fetch_mobile_link 'http://www.jd.com/allSort.aspx', '手机'
    expect(mobile_link).to eq 'http://list.jd.com/list.html?cat=9987,653,655'
  end
  
  it "fetch mobile merchants" do
    merchants = @fetcher.fetch_mobile_merchants 'http://list.jd.com/list.html?cat=9987,653,655', '手机'
    expect(merchants).to include '华为（HUAWEI）'
    expect(merchants).to include 'LG'
    expect(merchants).to include '谷歌（Google）'
  end
end