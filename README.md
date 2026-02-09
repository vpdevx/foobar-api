# foobar-api

1. Create your cluster

2. Deploy traefik

3. Generate certs

4. Deploy helm chart

```
helm upgrade -i foobar-api ./devops/charts/foobar-api -f devops/charts/foobar-api/values.yaml --set-file tlsSecret.crtFile=./tls.crt --set-file tlsSecret.keyFile=./tls.key -n foobar-api --create-namespace


---

Solution for foobar-api:

The team wants to ship a Go program (https://github.com/containous/foobar-api), and expose its API through HTTPS.
The team told you that the certificates should be in a PVC. Expose it using traefik.

1. Dockerize the app
2. Create the helm chart
3. Since the certs needs to be in a PVC, let's define the cert and key on the values.yaml, create a secret and with an init container, we'll copy it's content and copy it into the PVC that will be used by the application.
4. Expose the app using IngressRouteTCP with tls passthrough
