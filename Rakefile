begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  
  require 'standalone_migrations'
  StandaloneMigrations::Tasks.load_tasks
    
  
  task :default => :spec
rescue LoadError
  # no rspec available
end