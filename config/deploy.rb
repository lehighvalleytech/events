default_run_options[:pty] = true

set :application, 'events'
set :repository, 'git@github.com:lehighvalleytech/events.git'
set :deploy_to, '/var/www/sites/lvhack2012'
set :scm, 'git'
set :user, 'deploy'

role :app, '50.56.181.242'
role :web, '50.56.181.242'
role :db, '50.56.181.242', :primary => true

set :branch, 'lvhack2012'
set :deploy_via, :remote_cache
set :git_enable_submodules, 1
set :use_sudo, false
set :rake, "/opt/ruby/bin/rake"

set :default_environment, {
  'PATH' => "/opt/ruby/bin:$PATH",
  'GEM_HOME' => "/opt/ruby/lib/ruby/gems/1.8/gems" 
}

namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} /etc/init.d/apache2 reload"
  end
end
