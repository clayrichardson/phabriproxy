
task :default => :build

task :build do
  sh('docker build -t phabriproxy ./')
end

task :run do
  sh('docker run -d -link phabricator:phab -t -p 80:80 -p 443:443 phabriproxy')
end

task :attach do
  sh('docker attach phabriproxy')
end

task :interactive do
  sh('docker run -link phabricator:phab  -t -p 80:80/tcp -p 443:443/tcp -i phabriproxy')
end

task :shell do
  sh('docker run -link phabricator:phab -t -p 80:80/tcp -p 443:443/tcp -i phabriproxy /bin/bash')
end

task :kill do
  sh('docker ps -q | xargs docker kill')
end

