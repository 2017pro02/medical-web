namespace :before_build do
  desc "Install node packages"
  task install: :environment do
    if Rails.env == "heroku"
      cd "client" do
        sh "npm install"
      end
    else
      sh "npm install"
    end
  end
end

Rake::Task["assets:precompile"].enhance(%i[before_build:install])
