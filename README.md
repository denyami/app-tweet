```
make docker_compose_up
```
```
make docker_compose_exec
```
```
rails new sampleApp
```
```
curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
```
```
echo 'PATH="/usr/local/heroku/bin:$(PATH)"' >> ~/.bashrc
```
```
heroku login --interactive
```
```
heroku create exampleapp$(whoami)$(date "+%Y%m%d")
```
```
vim sampleApp/app/controllers/portfolio_controller.rb
```
```
rails g controller portfolio
```
```
class PortfolioController < ApplicationController
  def index

  end
end

```
```
vim sampleApp/app/views/portfolio/index.html.erb
```
```
<h1>hello</h1>
```
```
vim sampleApp/config/routes.rb 

```
```
Rails.application.routes.draw do
    root  'portfolio#index'  #この1行を追加
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

```
```
vim sampleApp/Gemfile
```
```
gem 'sqlite3', '~> 1.4'
->
#gem 'sqlite3', '~> 1.4'
```
```
group :development do
  gem 'sqlite3', '~> 1.4'#added
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :heroku do
  gem 'pg'
end
```
```
bundle --without heroku
```
```
git add .
```
```
git commit -m "initial commit"
```
```
git push heroku master
```
```
heroku open
```
