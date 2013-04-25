source 'https://rubygems.org'

gem 'rails', '3.2.11'

gem 'slim'
gem 'bootstrap-sass'

gem 'cancan'
gem 'devise'
gem 'inherited_resources'
gem 'jquery-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'debugger'
end

group :development, :test do
  gem 'sqlite3', '1.3.5'
  gem "rspec", "~> 2.12.0"
  gem 'rspec-rails', "~> 2.0"
  gem 'guard-rspec', '1.2.1'
  gem 'guard-spork', '1.2.0'
  gem 'spork', '0.9.2'
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'randexp'
  gem 'rb-fsevent'
  gem 'terminal-notifier-guard'
  gem 'simplecov', :require => false
end

group :production do
  gem 'pg', '0.12.2'
end
