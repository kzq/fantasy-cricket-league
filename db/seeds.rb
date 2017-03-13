# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  
  description = 'The Pakistan Super League (PSL) (Urdu: پاکستان سپر لیگ‎) is a professional franchise Twenty20 men''s cricket league. The league is headquartered in Lahore and, as of 2017, consists of five franchises nominally representing cities in Pakistan. It is operated by the Pakistan Cricket Board (PCB) and was established in 2016. Due to the security situation in Pakistan, the first season of the league operated entirely in the United Arab Emirates (UAE). The final of the 2017 season was held in Lahore.'
  League.create(name: 'PSL', country: 'Pakistan', description: description)
  description = 'The Indian Premier League is a professional Twenty20 cricket league in India contested during April and May of every year by franchise teams representing Indian cities. The league was founded by the Board of Control for Cricket in India in 2007.'
  League.create(name: 'IPL', country: 'India', description: description)