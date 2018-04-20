# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

activities = [{:title => 'CS3300 - Software Engineering', :startTime => '10:00', :duration => 75, :owner_ID => '1'},
activities = {:title => 'CS4300 - Software Re-engineering', :startTime => '10:00', :duration => 75, :owner_ID => '2'}]

users = [{:email => 'test@test.com', :password => 'testtest', :compensation => 300},
users = {:email => 'maxed@test.com', :password => 'maxedtest', :compensation => 500},
users = {:email => 'work@please.com', :password => 'workplease', :compensation => 500}]


activities.each do |activity|
  Activity.create!(activity)
end

users.each do |user|
  User.create!(user)
end