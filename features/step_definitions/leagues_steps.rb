def create_league(name, country)
  League.create name: name, country: country
end

Given(/^I send and accept JSON$/) do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'  
end

Given(/^the system knows about the following leagues:$/) do |leagues|
  leagues.hashes.each_with_object({}) do |row, hash|
    name, country = row["league"], row["origin"]
    create_league(name, country) 
  end  
end  

When(/^client requests GET "([^"]*)"$/) do |path|
  get(path)   
end

Then(/^the response status should be "([^"]*)"$/) do |status|
  expect(last_response.status).to eq(status.to_i)
end 

Then(/^it has following attributes$/) do |table|
  expected_items = table.hashes
  data = JSON.parse(last_response.body)["data"][0]
  puts ">>>>>>>>>expected_items=#{expected_items}"
  puts ">>>>>>>>>data=#{data}"
  expected_items.each_with_object({}) do |row, hash |
    name, country = row["name"], row["country"]
    k = data["attributes"].find {|h1| h1['name'] == name}
    puts k  
  end  
  pending # Write code here that turns the phrase above into concrete actions
end
