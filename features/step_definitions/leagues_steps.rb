Given(/^I send and accept JSON$/) do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'  
end

Given(/^the system knows about the following leagues:$/) do |leagues|
  puts "------"
  puts leagues.hashes
  puts "------"
end  

When(/^client requests GET "([^"]*)"$/) do |path|
  get(path)   
end

Then(/^the response status should be "[^\"]*"$/) do |status|
  (last_response.status).to eq(status.to_i)
end 
