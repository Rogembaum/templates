kubectl run istio-debug --rm -it --image=istio/istioctl -- bash

# Get Envoy config dump
curl http://localhost:15000/config_dump

# Check specific route configuration
istioctl proxy-config routes -n istio-system deploy/istio-ingressgateway

# Check listeners
istioctl proxy-config listeners -n istio-system deploy/istio-ingressgateway

# Check clusters
istioctl proxy-config clusters -n istio-system deploy/istio-ingressgateway

# Check endpoints
istioctl proxy-config endpoints -n istio-system deploy/istio-ingressgateway

# Analyze Istio configuration
istioctl analyze

# Check Envoy stats
curl http://localhost:15000/stats

# Check Envoy server info
curl http://localhost:15000/server_info

# Check specific filter configuration
curl http://localhost:15000/config_dump | jq '.configs[] | select(.["@type"] == "type.googleapis.com/envoy.admin.v3.ListenersConfigDump")'
