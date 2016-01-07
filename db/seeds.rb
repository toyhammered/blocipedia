class CreateSeeds
  def new_user(amount, email, role)
    amount.times do
      u = User.new(
        email: email,
        password: "fakefake",
        password_confirmation: "fakefake",
        confirmed_at: Time.now,
        role: role
      )
      unless u.save
        u.update_attributes(email: Faker::Internet.safe_email)
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

  def new_collaboration(amount, users, wikis)
    i = 0
    loop do
      break if i > 1000
      break if amount <= 0
      user = users.sample
      wiki = wikis.sample

      unless user.id == wiki.user_id
        c = Collaborator.new(
          user_id: user.id,
          wiki_id: wiki.id
        )
        if c.save
          amount -= 1
        end
      end

      i += 1
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


# Collaborations
create.new_collaboration(500, users, wikis)

# Seeding Completed
puts "Seeding Finished."
puts "#{User.count} users created."
puts "#{Wiki.count} wikis created."
puts "#{Collaborator.count} collaborations created."
