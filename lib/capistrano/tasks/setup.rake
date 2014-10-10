namespace :deploy do
  desc "Install everything onto the server"
  task :setup_config do
    run "echo 'SETUP'"
  end
end
