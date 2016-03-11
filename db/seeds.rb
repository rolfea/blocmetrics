# creates users
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: "helloworld",
    confirmed_at: "2016-02-15 18:00:00"
  )
end
users = User.all

# creates RegisteredApplications
30.times do
  RegisteredApplication.create!(
    name: Faker::App.name,
    URL: Faker::Internet.url,
    user_id: rand(1..10)
  )
end
registered_applications = RegisteredApplication.all

60.times do
  Event.create!(
    name: Faker::Hipster.word,
    registered_application_id: rand(1..30)
  )
end


puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} wikis created"
puts "#{Event.count} events created"
