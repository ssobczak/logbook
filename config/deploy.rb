# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"

set :application, "logbook"
set :repo_url, "https://github.com/ssobczak/logbook.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/lemp/logbook_cap"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, File.read('.ruby-version').strip

set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

set :tmp_dir, '/tmp/logbook'

# set :format, :pretty

namespace :deploy do
  task :bundle do
    on roles(:all) do
      within "#{deploy_to}/current" do
        execute :bundle, :install
      end
    end
  end

  task :update_jekyll do
    on roles(:static) do
      within "#{deploy_to}/current" do
      	execute :bundle, :exec, :jekyll, :build
      end
    end
  end

end

after "deploy:symlink:release", "deploy:bundle"
after "deploy:bundle", "deploy:update_jekyll"
