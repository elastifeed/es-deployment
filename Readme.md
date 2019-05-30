# Kubernetes yaml for elastifeed
> We are currently trying to run elastifeed inside of kubernetes. Everything has been containerized

## Getting a development system up and running
I recommend going for a lightway kubernetes distrubution like [k3s](https://k3s.io/). It can run on one node (even *inside* an docker container), so you can have a full k8s environment in your pocket :-)
Just make sure you have the namespace `elastifeed` enabled as this will be the namespace for deployments, services and ingress. (just apply `namespace.yaml`)

## Applying the yaml definitions
`kubectl apply -f whatever.yaml`

## Viewing the cluster state
You can always run `kubectl get --namespace=elastifeed all` which will list deployments, services, ingress and the underlying structures needed for this.
If you want to e.g. get a shell to a pod of the `es-rss` deployment, you can first query all pods for this deployment via `kubectl get --namespace=elastifeed -l app=es-rss pods`, pick one out of the list and the execute a shell:
```
[lola ~] kc get --namespace=elastifeed -l app=es-rss pods
NAME                                 READY   STATUS    RESTARTS   AGE
es-rss-deployment-5db8d7859d-fftdd   1/1     Running   0          3m45s
es-rss-deployment-5db8d7859d-g8rcb   1/1     Running   0          3m45s
es-rss-deployment-5db8d7859d-k4mss   1/1     Running   0          3m45s
es-rss-deployment-5db8d7859d-xvfnf   1/1     Running   0          3m45s
[lola ~] kc exec --namespace=elastifeed -it es-rss-deployment-5db8d7859d-xvfnf /bin/ash
/ # ps
PID   USER     TIME  COMMAND
    1 root      0:00 /go/bin/es-rss
   10 root      0:00 /bin/ash
   16 root      0:00 ps
/ # 
```