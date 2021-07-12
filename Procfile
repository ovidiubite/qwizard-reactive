web: bin/rails server -p $PORT -e $RAILS_ENV
worker: bundle exec sidekiq -c 2 -q qwizard_reactive_production_default
cable: bundle exec puma -p 28080 cable/config.ru
release: bundle exec rake db:migrate
