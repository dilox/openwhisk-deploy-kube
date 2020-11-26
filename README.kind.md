## Deploy io-sdk on kind

download kind from:

```
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.9.0/kind-linux-amd64
chmod +x ./kind
mv ./kind /usr/local/bin/kind
```
create cluster
```
kind create cluster --config kind/kind-cluster.yaml
```
set kind as current context
```
kubectl config set current-context kind-kind
```

label nodes:
```
kubectl label node kind-worker openwhisk-role=core
kubectl label node kind-worker2 openwhisk-role=invoker
```

get the output from:
```
kubectl describe node kind-worker | grep InternalIP: | awk '{print $2}'
```

and edit INTERNAL_IP on kind/mycluster.yaml

install openwhisk
```
helm install openwhisk -f kind/mycluster.yaml helm/openwhisk/
```
wait for all pod to be running

```
helm install io-sdk helm/io-sdk/
```
set openwhisk http port:

```
kubectl describe node kind-worker | grep InternalIP: | awk '{print $2}'
wsk property set --apihost http://$(kubectl describe node kind-worker | grep InternalIP: | awk '{print $2}'):$(kubectl get svc --namespace default openwhisk-nginx -o jsonpath='{.spec.ports[0].nodePort}')
```

execute an action:

```
wsk  action  invoke /guest/iosdk/config -r
```

URLS:

traefik:

http://localhost:31002/dashboard/#/

io-sdk:

http://localhost:31003/app/#/

import url:

http://172.18.0.3:31800/api/v1/web/guest/util/sample

