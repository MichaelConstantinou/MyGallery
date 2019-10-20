# I would normally run DatabaseCleaner as best practice but had issues configuring it
# RSpec.configure do |config|
 
#   config.before(:each) do
#     DatabaseCleaner.strategy = :transaction
#   end
 
#   config.before(:each) do
#     DatabaseCleaner.start
#   end
 
#   config.after(:each) do
#     DatabaseCleaner.clean
#   end
 
# end