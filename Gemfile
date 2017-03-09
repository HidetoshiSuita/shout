source 'https://rubygems.org'
ruby '2.3.3'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

gem 'sqlite3', group: :development
# 本番ではpostgressを使用する
gem 'pg', group: :production

# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'bcrypt-ruby', '3.1.1.rc1', :require => 'bcrypt'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
group :development do
  # 高機能コンソール
  gem 'pry-rails'
  #テスト
  gem 'rspec-rails'
  gem 'guard-rspec', require: false #guardでrspecを動かす
  gem 'terminal-notifier'
  gem 'terminal-notifier-guard'#デスクトップ通知を行う
  # デバッガー
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  # カバレッジ取得
  gem "simplecov"
  # pryの入出力に色付け
  gem 'pry-coolline'
  gem 'awesome_print'

  # PryでのSQLの結果を綺麗に表示
  gem 'hirb'
  gem 'hirb-unicode'
end

gem 'devise'
#deviseのインストール
gem 'rails-i18n'
gem 'devise-i18n'
gem 'devise-i18n-views'
#deviseの日本語化↑
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'ransack'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem "rb-readline", :require => false
gem 'wdm', '>= 0.1.0' if Gem.win_platform?

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
