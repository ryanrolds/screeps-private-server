# Screeps Private Server K8s

#### Datastores:
```
kubectl create secret generic mongo-creds --namespace screeps \
  --from-literal=MONGO_INITDB_DATABASE=screeps \
  --from-literal=MONGO_INITDB_ROOT_USERNAME=screeps \
  --from-literal=MONGO_INITDB_ROOT_PASSWORD=password 

kubectl apply -f k8s/mongo-data.yaml
kubectl apply -f k8s/mongo-statefulset.yaml
kubectl apply -f k8s/mongo-service.yaml


kubectl apply -f k8s/redis-deployment.yaml
kubectl apply -f k8s/redis-service.yaml
```

#### Private server config:
```
export STEAM_API_KEY=...
export SERVER_PASSWORD=...
envsubst < k8s/pserver-config.cm.yaml | kubectl apply -f - 
```

```
kubectl apply -f k8s/pserver-data-sc.yaml
kubectl apply -f k8s/pserver-data-pvc.yaml
```

#### Publishing updated image:
```
docker build .
<get final tag (aff013eaf3a7) from output >
export DOCKER_REPO=example.domain.com
export TAG_NAME=aff013eaf3a7
docker tag $TAG_NAME $DOCKER_REPO/screeps-pserver:$TAG_NAME
docker push $DOCKER_REPO/screeps-pserver:$TAG_NAME
```

#### Create private server deployment:
```
envsubst < k8s/pserver-deployment.yaml | kubectl apply --namespace screeps -f - 
```

## Interacting with the Private Server

