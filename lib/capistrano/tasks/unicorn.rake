set :unicorn_log, -> { shared_path.join("log/unicorn.log") }
set :unicorn_pid, -> { current_path.join("tmp/pids/unicorn.pid") }
set :unicorn_config, -> { shared_path.join("config/unicorn.rb") }
set :unicorn_user, fetch(:user) 
set :unicorn_workers, 2

namespace :unicorn do
  desc "Setup Unicorn initializer and app configuration"
  task :setup do
    on roles(:app) do
      execute :mkdir, " -p #{shared_path}/config"
      template "unicorn.rb.erb", "#{shared_path}/config/unicorn.rb"
      template "unicorn_init.erb", "/tmp/unicorn_init"
      execute :chmod, "+x", "/tmp/unicorn_init"
      sudo :mv, "/tmp/unicorn_init /etc/init.d/unicorn_#{fetch(:application)}"
      sudo "update-rc.d -f unicorn_#{fetch(:application)} defaults"
    end
  end
  # after "deploy:setup", "unicorn:setup"

  %w[start stop restart].each do |command|
    desc "#{command} unicorn"
    task command do
      on roles :app do
        execute "service unicorn_#{fetch(:application)} #{command}"
      end
    end
    # after "deploy:#{command}", "unicorn:#{command}"
  end

end
