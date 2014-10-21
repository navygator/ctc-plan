set :mysql_host, "localhost"
set :mysql_user,'root' 
set :mysql_password,  'ghjcgthj' 
set :mysql_database, "ctc_plan_production" 

namespace :mysql do
  desc "Install the latest stable release of MySql."
  task :install do
    on roles :db, only: {primary: true} do
      run "#{sudo} apt-get -y update"
      run "#{sudo} apt-get -y install mysql-server mysql-client libmysqlclient15-dev"
    end
  end
  # after "deploy:install", "mysql:install"

  desc "Create a database for this application."
  task :create_database do
    on roles :db, only: {primary: true} do
      def database_exits?
        exists = false

        execute "mysql --user=#{fetch(:mysql_user)} --password=#{fetch(:mysql_password)} --execute=\"show databases;\"" do |channel, stream, data|
          exists = exists || data.include?(fetch(:mysql_database))
        end

        exists
      end
      def create_database
        create_sql = <<-SQL
        CREATE DATABASE #{fetch(:mysql_database)};
        SQL

        execute "mysql --user=#{fetch(:mysql_user)} --password=#{fetch(:mysql_password)} --execute=\"#{create_sql}\""
      end
      def setup_database_permissions
        grant_sql = <<-SQL
        GRANT ALL PRIVILEGES ON #{fetch(:mysql_database)}.* TO #{fetch(:mysql_user)}@localhost IDENTIFIED BY '#{fetch(:mysql_password)}';
        SQL

        execute "mysql --user=#{fetch(:mysql_user)} --password=#{fetch(:mysql_password)} --execute=\"#{grant_sql}\""
      end
      unless database_exits?
        create_database
        setup_database_permissions
      end
    end
  end

  desc "Generate the database.yml configuration file."
  task :setup do
    on roles :app do
      # execute "mkdir -p #{shared_path}/config"
      template "database.yml.erb", "#{shared_path}/config/database.yml"
    end
    after "mysql:setup", "mysql:create_database"
  end
  # after "deploy:setup", "mysql:setup"

  desc "Symlink the database.yml file into latest release"
  task :symlink do
    on roles :app do
      execute "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    end
  end
  # after "deploy:finalize_update", "mysql:symlink"
end