class CreateSeeds
  def new_user(amount, email, role)
    @amount = amount

    @amount.times do
      return if @amount <= 0

      begin
        User.create!(
          email: email,
          password: "fakefake",
          password_confirmation: "fakefake",
          confirmed_at: Time.now,
          role: role
        )

      rescue ActiveRecord::RecordInvalid
        email = Faker::Internet.safe_email
        new_user(@amount - 1, email, role)
      end
    end
  end

  def new_wiki(amount, users)
    amount.times do
      user = users.sample
      Wiki.create!(
        user: user,
        title: Faker::Book.title,
        body: Faker::Hipster.paragraph,
        private: user.standard? ? false : [true,false].sample
      )
    end
  end

end # end of CreateUser class

create = CreateSeeds.new

# Users
create.new_user(1,"daniel@rassiner.com", :admin)
create.new_user(1,"admin@example.com", :admin)
create.new_user(1,"premium@example.com", :premium)
create.new_user(1,"standard@example.com", :standard)
create.new_user(5, Faker::Internet.safe_email, :standard)

users = User.all


# Wikis
create.new_wiki(75, users)

wikis = Wiki.all


# Seeding Completed
puts "Seeding Finished."
puts "#{User.count} users created."
puts "#{Wiki.count} wikis created."
