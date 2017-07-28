lock '3.8.2'

set :repo_url, 'git@github.com:micbelgique/covfefe-desk.git'
set :repo_tree, 'backend'

set :keep_releases, 10

set :linked_files, %w{config/database.yml}
set :linked_dirs,  %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle private/system public/system}

set :rbenv_type, 'user'
set :rbenv_ruby,  File.read('.ruby-version').strip

#after  'deploy:publishing',        'delayed_job:restart'
#before 'deploy:assets:precompile', 'deploy:npm:install'
