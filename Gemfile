source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.2'
gem 'pry-byebug'
gem 'rom', '~> 4.0'
gem 'rom-sql'
gem 'dry-system'

gem 'sqlite3'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun', platforms: :ruby
  gem 'hanami-webconsole'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
end

group :test do
  gem 'minitest'
  gem 'capybara'
  gem 'database_cleaner'
end

group :production do
  # gem 'puma'
end
