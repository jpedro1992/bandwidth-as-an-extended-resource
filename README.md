# bandwidth-as-an-extended-resource

This repo contains the bandwidth component for the Diktyo framework. 

The goal is to advertise bandwidth resources as **extended resources** to allow already available filter/scoring plugins (e.g., `PodFitsResources`, 
`BalancedAlocation`) to consider bandwidth allocation in Kubernetes clusters.

# Example to patch node with bandwidth:

`curl --cacert ca.crt -H "Authorization: Bearer $token" --header "Content-Type: application/json-patch+json" --request PATCH --data '[{"op": "add", "path": "/status/capacity/network.aware.com~1bandwidth", "value": "1000000000"}]' https://10.2.0.113:6443/api/v1/nodes/<node-name>/status`

# Script for master node

`./script.sh enp1s0f0 127.0.0.1:8001`

# Script for outside (Authentication required)

`./scriptWithAuthentication.sh enp1s0f0 10.2.0.113:6443`


