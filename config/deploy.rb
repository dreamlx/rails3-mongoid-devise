# config valid only for Capistrano 3.1
lock '3.1.0'

require 'rvm/capistrano' # 支持rvm
require 'bundler/capistrano'  # 支持自动bundler
set :rvm_autolibs_flag, "read-only"        # more info: rvm help autolibs
set :rvm_ruby_string, :local               # use the same ruby as used locally for deployment

before 'deploy:setup', 'rvm:install_rvm'   # install RVM
before 'deploy:setup', 'rvm:install_ruby'  # install Ruby and create gemset, OR:
before 'deploy:setup', 'rvm:create_gemset' # only create gemset


set :application, 'video_show'


set :keep_releases, 10 
set :location, "192.168.1.64" #部署的ip地址
# set :location, "http://tangdigital.com/"
role :web, location                       # Your HTTP server, Apache/etc
role :app, location                       # This may be the same as your `Web` server
role :db,  location, :primary => true # This is where Rails migrations will run
#role :db,  "3dtzk.com"

#server details
default_run_options[:pty] = true  # Must be set for the password prompt
set :deploy_to, "/home/railsapp/video_show"  #部署在服务器上的地址

set :user, "root" #ssh连接服务器的帐号
set :use_sudo, false
set :ssh_options, { :forward_agent => true }
#repo details
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm_username, ENV["GITHUB_USERNAME"] #github帐号
set :scm_passphrase, ENV["GITHUB_PASSWORD"] #设置github  ssh时设置到密码
set :repo_url, 'git@github.com:dreamlx/rails3-mongoid-devise.git'
set :branch, "master" #github上具体的分支
set :deploy_via, :remote_cache



# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

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
