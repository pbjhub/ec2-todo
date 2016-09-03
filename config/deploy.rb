# config valid only for current version of Capistrano
lock '3.6.1'

set :rvm_type, :user
set :rvm_ruby_version, '2.3.0'

set :user, 'ubuntu'
set :application, 'todoapp'
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}/releases"
set :repo_url, 'https://github.com/pbjhub/ec2-todo.git'
set :branch, :master
set :keep_releases, 5

set :ssh_options, { forward_agent: true, user: fetch(:user)}
set :linked_files, %w{config/database.yml config/secrets.yml .env}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundler}

set :puma_threads, [4,16]
set :puma_workers, 0

set :pty, true
set :use_sude, false
set :puma_bind, "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log, "#{release_path}/log/puma.error.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_recrd, true

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
 set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
