source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use mysql as the database for Active Record

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'foundation-rails'
gem 'geocoder'
gem 'haml'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
#gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'stattleship-ruby', :git => 'http://github.com/stattleship/stattleship-ruby.git'
gem 'dotenv-rails', :groups => [:development, :test]
gem 'devise'
gem 'mapbox-rails'
gem 'friendly_id', '~> 5.1.0'
gem 'geokit-rails'
gem "font-awesome-rails"
gem 'foundation-icons-sass-rails'
gem 'rack-tracker'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'minitest-byebug'
  gem 'annotate'
  gem "erb2haml" 
  gem 'mysql2', '>= 0.3.13', '< 0.5'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  
  #gem 'capistrano'
  #gem 'capistrano-ext'
  #gem 'capistrano-rbenv'
  #gem 'capistrano-rails', '~> 1.1'
  #gem 'capistrano-safe-deploy-to', '~> 1.1.1'
  #gem 'capistrano-github', github: 'capistrano/github'
  #gem 'octokit', github: 'octokit/octokit.rb', branch: 'deployments-preview'
end

group :production do
  gem 'pg'
  #gem 'unicorn'
end

