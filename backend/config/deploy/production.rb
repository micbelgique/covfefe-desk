server '192.81.223.149', user: 'deploy', roles: %w{web app db}
# 192.81.223.149
# famidesk.80limit.com

set :application, 'backend'
set :deploy_to,   '/home/deploy/apps/backend'
set :branch,      'master'
