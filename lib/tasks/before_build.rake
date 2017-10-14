namespace :before_build do
  desc "Install node packages"
  task install: :environment do
    sh "npm install"
  end
end

Rake::Task["assets:precompile"].enhance(%i[before_build:install])
