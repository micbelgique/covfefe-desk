server 'famidesk.80limit.com', user: 'deploy', roles: %w{web app db}

set :application, 'backend'
set :deploy_to,   '/home/deploy/apps/backend'
set :branch,      'master'
