Dir["#{File.dirname(__FILE__)}/mercury/jd/*.rb"].sort.each do |file|
  require file
end

Dir["#{File.dirname(__FILE__)}/mercury/util/*.rb"].sort.each do |file|
  require file
end