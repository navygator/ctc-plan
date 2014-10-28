namespace :nginx do
  desc "Install latest stable release of nginx"
  task :install do
    on roles(:web) do
      #run "#{sudo} add-apt-repository ppa:nginx/stable"
      sudo "apt-get -y update"
      sudo "apt-get -y install nginx"
    end
  end
  # after "deploy:install", "nginx:install"

  desc "Setup nginx configuration for this application"
  task :setup do
    on roles(:web) do
      template "nginx.conf.erb", "/tmp/nginx.conf"
      sudo :mv, "/tmp/nginx.conf /etc/nginx/sites-enabled/#{fetch(:application)}"
      sudo :rm, "-f /etc/nginx/sites-enabled/default"
      # restart
    end
  end
  # after "nginx:setup", "nginx:restart" 
  # after "deploy:setup", "nginx:setup"
  
  %w[start stop restart].each do |command|
    desc "#{command} nginx"
    task command do
      on roles(:web) do      
        execute "#{sudo} service nginx #{command}"
      end
    end
  end
end
