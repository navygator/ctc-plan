# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'ctc-plan'
set :repo_url, 'git@github.com:navygator/ctc-plan.git'
set :user,  "deployer"

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# which config files should be copied by deploy:setup_config
# see documentation in lib/capistrano/tasks/setup_config.cap
# for details of operations
set(:config_files, %w(
  nginx.conf
  database.example.yml
  log_rotation
  monit
  unicorn.rb
  unicorn_init.sh
))

# which config files should be made executable after copying
# by deploy:setup_config
# set(:executable_config_files, %w(
#   unicorn_init.sh
# ))

# files which need to be symlinked to other parts of the
# filesystem. For example nginx virtualhosts, log rotation
# init scripts etc.
# set(:symlinks, [
#   {
#     source: "nginx.conf",
#     link: "/etc/nginx/sites-enabled/#{fetch(:application)}"
#   },
#   {
#     source: "unicorn_init.sh",
#     link: "/etc/init.d/unicorn_#{fetch(:application)}"
#   },
#   {
#     source: "log_rotation",
#    link: "/etc/logrotate.d/#{fetch(:application)}"
#   },
#   {
#     source: "monit",
#     link: "/etc/monit/conf.d/#{fetch(:application)}.conf"
#   }
# ])



namespace :deploy do
  
  # before :deploy, "deploy:check_revision"
  # compile assets locally then rsync
  # after 'deploy:symlink:shared', 'deploy:compile_assets_locally'
  after :finishing, 'deploy:cleanup'
  
  # remove the default nginx configuration as it will tend
  # to conflict with our configs.
  # before 'deploy:setup_config', 'nginx:remove_default_vhost'

  # reload nginx to it will pick up any modified vhosts from
  # setup_config
  # after 'deploy:setup_config', 'nginx:reload'

  # Restart monit so it will pick up any monit configurations
  # we've added
  # after 'deploy:setup_config', 'monit:restart'

  # As of Capistrano 3.1, the `deploy:restart` task is not called
  # automatically.
  after 'deploy:publishing', 'deploy:restart'

  desc "Setup"
  task :setup_config do
    run 'echo "1..1...1"'
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
