Schema:
User -> HAproxy -> IngressController(daemonset) -> IngressResource -> Service -> Deployment -> Pod

Settings:
1. Install K8s cluster
2. Install HAproxy
3. Install and Configure IngressController
https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-manifests/
