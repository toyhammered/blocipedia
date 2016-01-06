source 'https://rubygems.org'

ruby '2.2.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'faker'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '1.6.0'
  gem 'sqlite3'
  gem 'pry-rails'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails', '~>3.0'
  gem 'capybara'
  gem 'shoulda'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'faker'
end

gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'

gem 'devise'
gem 'figaro'
gem 'font-awesome-rails'
gem 'pundit'

gem 'stripe'
gem 'stripe-ruby-mock', '~> 2.2.1', :require => 'stripe_mock'
gem 'redcarpet'


gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'


# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
