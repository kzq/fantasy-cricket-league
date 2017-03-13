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
  response = JSON.parse(last_response.body)
  expected_items = table.raw
  expected_items.shift
  expected_items.each do |row|
    name, country = row[0], row[1]
    expect(last_response.body.include?(name)).to be(true)
    expect(last_response.body.include?(country)).to be(true)
  end
end
