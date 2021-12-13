# Screeps Private Server K8s

```
export STEAM_API_KEY=...
export SERVER_PASSWORD=...
envsubst < k8s/pserver-config.cm.yaml | kubectl apply -f - 
```

```
kubectl apply -f k8s/pserver-data-sc.yaml
kubectl apply -f k8s/pserver-data-pvc.yaml
```

```
docker build .
<get final tag (aff013eaf3a7) from output >
export DOCKER_REPO=example.domain.com
export TAG_NAME=aff013eaf3a7
docker tag $TAG_NAME $DOCKER_REPO/screeps-pserver:$TAG_NAME
docker push $DOCKER_REPO/screeps-pserver:$TAG_NAME
```

```
envsubst < k8s/pserver-deployment.yaml | kubectl apply --namespace screeps -f - 
```
