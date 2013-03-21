
set :application, "document_app"

default_run_options[:pty] = true 
set :repository,  "git@github.com:rgarbi/document_app.git"
set :scm, "git"


# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "ubuntu"


set :stages, ["staging", "production"]
set :default_stage, "staging"

server "ec2-204-236-156-83.us-west-1.compute.amazonaws.com", :app, :web, :db, :primary => true
set :deploy_to, "/var/www/document_app"

ssh_options[:keys] = ["/AWS-Keys/capDeployTest.pem", "/Users/rgarbi/.ssh/id_rsa"]

after 'deploy:update_code', 'deploy:symlink_db'


namespace :deploy do

desc "Restart Application"
task :restart, :roles => :app do
run "touch #{deploy_to}/#{shared_dir}/tmp/restart.txt"
end

desc "Symlinks the database.yml"
task :symlink_db, :roles => :app do
run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
end

end

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end