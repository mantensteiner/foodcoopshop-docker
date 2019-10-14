# Create folders
mkdir -p /var/lib/letsencrypt
mkdir -p /etc/letsencrypt
mkdir -p /usr/share/nginx/html

# Init Docker swarm
docker swarm init --advertise-addr IP
# Join existing swarm as node
# docker swarm join --token TOKEN IP

# Generate ssl certificate
bash generate.sh

# Pull images before starting cluster (more stable with swarm)
docker pull nginx:stable-alpine
docker pull mantenpanther/foodcoopshop
docker pull mazzolino/shepherd

# Start stack 
docker stack deploy -c docker-compose.yml foodcoopshop

# Create cron-job for ssl-renewal
bash add_renew_cron.sh