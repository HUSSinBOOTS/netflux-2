pip install --upgrade --user awscli
export PATH=$PATH:$HOME/.local/bin
eval $(aws ecr get-login --region $AWS_DEFAULT_REGION --no-include-email)
docker tag netflux:latest $IMAGE_REPO_URL:latest
docker push $IMAGE_REPO_URL:latest
add-apt-repository ppa:eugenesan/ppa
apt-get update
apt-get install jq -y
curl https://raw.githubusercontent.com/silinternational/ecs-deploy/master/ecs-deploy | sudo tee -a /usr/bin/ecs-deploy
sudo chmod +x /usr/bin/ecs-deploy
ecs-deploy -c $CLUSTER_NAME -n $SERVICE_NAME -i $IMAGE_REPO_URL:latest
