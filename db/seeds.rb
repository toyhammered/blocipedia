1.times do
  user = User.create!(
    email: "daniel@rassiner.com",
    password: "fakefake",
    password_confirmation: "fakefake",
    confirmed_at: Time.now,
    role: 2
  )

end

1.times do
  user = User.create!(
    email: "fake@fake.com",
    password: "fakefake",
    password_confirmation: "fakefake",
    confirmed_at: Time.now,
  )

end
5.times do
  user = User.create!(
    email: Faker::Internet.safe_email,
    password: "fakefake",
    password_confirmation: "fakefake",
    confirmed_at: Time.now
  )

end
users = User.all

40.times do
  wiki = Wiki.create!(
    user: users.sample,
    title: Faker::Book.title,
    body: Faker::Hipster.paragraph,
    private: [true,false].sample
  )
end

wikis = Wiki.all



puts "Seeding Finished."
puts "#{User.count} users created."
puts "#{Wiki.count} wikis created."
