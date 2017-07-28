namespace :app do
  task :reset => :environment do
    if Rails.env.development?
      system("RAILS_ENV=development  bundle exec rails db:environment:set")
    end

    system("RAILS_ENV=#{Rails.env} bundle exec rails db:migrate:reset")
    system("RAILS_ENV=#{Rails.env} bundle exec rails db:seed")
  end
end
