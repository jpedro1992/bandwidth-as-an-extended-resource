# bandwidth-as-an-extended-resource (Work in Progress)

This repo contains the bandwidth resource component (DaemonSet) for the network-aware framework proposed [here](https://github.com/jpedro1992/scheduler-plugins/tree/kep-networkAware/kep/260-network-aware-scheduling). 

The goal is to advertise bandwidth resources as **extended resources** to allow already available filter/scoring plugins (e.g., `PodFitsResources`, 
`BalancedAlocation`) to consider bandwidth allocation in Kubernetes clusters.
