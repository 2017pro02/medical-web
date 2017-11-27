namespace :deploy_sounds do
  task :set_se do
    cd "app/assets/sounds" do
      sh "curl -sO https://maoudamashii.jokersounds.com/music/se/mp3/se_maoudamashii_onepoint26.mp3"
    end
  end
end

Rake::Task["assets:precompile"].enhance do
  Rake::Task["deploy_sounds:set_se"].invoke
end
