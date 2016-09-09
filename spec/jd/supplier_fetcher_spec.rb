describe SupplierFetcher do
  
  it "fetch mobile link" do
    mobile_link = subject.fetch_mobile_link 'http://www.jd.com/allSort.aspx', '手机'
    expect(mobile_link).to eq 'http://list.jd.com/list.html?cat=9987,653,655'
  end
  
  it "fetch mobile merchants" do
    merchants = subject.fetch_mobile_merchants 'http://list.jd.com/list.html?cat=9987,653,655', '手机'
    expect(merchants).to include '华为（HUAWEI）'
    expect(merchants).to include 'LG'
    expect(merchants).to include '谷歌（Google）'
  end
end