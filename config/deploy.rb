
set :application, "document_app"

default_run_options[:pty] = true 
set :repository,  "git@github.com:rgarbi/document_app.git"
set :scm, "git"


# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "ubuntu"

server "ec2-54-241-48-49.us-west-1.compute.amazonaws.com", :app, :web, :db, :primary => true
set :deploy_to, "/home/ubuntu/deploy/document_app"

ssh_options[:keys] = ["/AWS-Keys/capDeployTest.pem", "/Users/rgarbi/.ssh/id_rsa"]



namespace :bundle do

  desc "run bundle install and ensure all gem requirements are met"
  task :install do
    run "cd #{current_path} && bundle install  --without=test --no-update-sources"
  end

end
before "deploy:restart", "bundle:install"

after "deploy", "deploy:migrate"


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