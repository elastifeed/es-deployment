# Kubernetes yaml for elastifeed
> We are currently trying to run elastifeed inside of kubernetes. Everything has been containerized

## Getting a development system up and running
I recommand going for a lightway kubernetes distrubution like [k3s](https://k3s.io/). It can run on one node (even *inside* an docker container), so you can have a full k8s environment in your pocket :-)

## Applying the yaml definitions
`kubectl apply -f whatever.yaml`
