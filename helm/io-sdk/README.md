helm install owdev ./helm/openwhisk -n openwhisk --create-namespace -f mycluster.yaml

- Setup dns entry point, you need 3 a records (example in values.yaml):
traefik:
  admin: traefik.noiopen.it
  api: api.noiopen.it
  iosdk: iosdk.noiopen.it
Dns point to loadbalancer external ip of you provider

helm install ./helm/io-sdk io-sdk -n io-sdk --create-namespace -f values.yaml
