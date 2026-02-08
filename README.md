# foobar-api

1. Create your cluster

2. Deploy traefik

3. Generate certs

4. Deploy helm chart

```
helm upgrade -i foobar-api ./devops/charts/foobar-api -f devops/charts/foobar-api/values.yaml --set-file tlsSecret.crtFile=./tls.crt --set-file tlsSecret.keyFile=./tls.key -n foobar-api --create-namespace
