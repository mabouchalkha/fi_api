source 'https://rubygems.org'

#ruby '2.1.5'

gem 'rails', '4.2'
gem 'devise'
gem 'rack-cors', :require => 'rack/cors'
gem 'active_model_serializers', '~> 0.8.0'
gem 'newrelic_rpm'
gem 'paper_trail'
gem 'bcrypt'
gem 'subscribem', path: 'lib/subscribem'

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
