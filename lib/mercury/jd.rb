Dir["#{File.dirname(__FILE__)}/jd/*.rb"].sort.each do |file|
  require file
end