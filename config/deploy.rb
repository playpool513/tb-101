# config valid only for current version of Capistrano
lock '3.4.0'

# your application name
set :application, 'tb-101'

# your git url
set :repo_url, 'git@github.com:playpool513/tb-101.git'

# rbenv setting
set :rbenv_type, :user
set :rbenv_ruby, "2.2.0"
set :rbenv_path, "/usr/local/rbenv"
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w(rake gem bundle ruby rails)
set :rbenv_roles, :all

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'
set :deploy_to, "/home/apps/tb-101"

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
# linked_files: after git clone is finished, the files would be copied from shared folder
set :linked_files, %w(config/database.yml config/secrets.yml)

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
# linked_dirs: after git clone is finished, the folders would be copied from shared folder
set :linked_dirs, %w{
  log
  tmp/pids
  tmp/cache
  tmp/sockets
  vendor/bundle
  public/system
}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

after "deploy:publishing", "deploy:restart"
after "deploy:restart", "unicorn:restart"
