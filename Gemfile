source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.5'

gem 'rails', '~> 6.1.6'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  #テスト用
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  # メールの送信を確認する
  # gem 'mailcatcher'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  # 左上のパフォーマンス表示のやつ
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # 
  gem 'solargraph'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver', '>= 4.0.0.rc1'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# 自動でlintしてくれる
gem 'rubocop', require:false
gem 'rubocop-rails', require:false
# html.slimを使うため
gem 'slim-rails'
gem 'html2slim'
# cssフレームワーク
# gem 'bootstrap'
# gem 'jquery-rails'
# デバッグ用
gem 'pry-rails'
# テーブルの情報をmodelに書き出してくれる
gem 'annotate'
# 日本語化の設定
gem 'rails-i18n'
# 論理削除を使うため
gem 'paranoia'
# それらしいユーザーを大量に追加する
gem 'faker'
# ログイン周り
gem 'devise'
gem 'devise-i18n'
# ページネーション
gem 'kaminari'
# 検索機能
gem 'ransack'
# 権限周り
gem 'banken'
# 環境変数の設定
gem 'dotenv-rails'
