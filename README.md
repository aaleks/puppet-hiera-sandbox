# puppet-hiera-sandbox
docker-compose up -d

#wait puppet master up and running 
docker logs --follow puppet 

#run on the agent 
docker exec -it puppetagentubuntu bash
puppet agent -t
