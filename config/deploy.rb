et :repository, "git://github.com/fernandolopes/intranet.git"

set :user, "pgm"
set :use_sudo, false
set :deploy_to, "/home/#{user}/#{application}"
set :scm, :git

server application, :app, :web, :db, :primary => true

after "deploy:update_code", "deploy:custom_symlinks"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :custom_symlinks do
    run "rm -rf #{release_path}/config/database.yml"
    run "ln -s #{shared_path}/database.yml #{release_path}/config/database.yml"
  end
end
