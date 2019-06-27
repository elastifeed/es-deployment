# Elastifeed on Kubernetes
> We are currently trying to run elastifeed inside of kubernetes. Everything has been containerized

## Getting a development system up and running
I recommend going for a lightway kubernetes distrubution like [k3s](https://k3s.io/). It can run on one node (even *inside* an docker container), so you can have a full k8s environment in your pocket :-)
Just make sure you have the namespace `elastifeed` enabled as this will be the namespace for deployments, services and ingress. (just apply `namespace.yaml`)

## Setting up S3 Storage
Have a look inside the s3 directory.

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

## Port mirroring the online running elasticsearch cluster
> As we are currently not deploying Elasticsearch on our k8s cluster, we need to provide it with another option

The production k8s cluster will run on the same nodes as the elasticsearch cluster.
We can connect a local (or remote) k8s cluster to the online running elasticsearch with ssh port forwarding.
On one of the cluster nodes, create a tmux or screen session and execute
`ssh -L 10.42.0.1:9200:localhost:9200 swl.xvzf.tech`
This command will forward the remote localhost on port 9200 and bind it to the local IP `10.42.0.1` on port 9200.
You need to replace 10.42.0.1 with your local k8s cluster IP. You can find this using e.g. the `iproute 2 package`. The default interface for the cluster is `cni0`. When you have a different setup, you will know what to look for:
```bash
[lola ~] ssh 172.16.0.160
Last login: Thu May 30 21:54:10 2019 from 172.16.0.130
[xvzf@r210ii ~]$ ip a s dev cni0
5: cni0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP group default qlen 1000
    link/ether 7a:33:10:f3:af:83 brd ff:ff:ff:ff:ff:ff
    inet 10.42.0.1/24 brd 10.42.0.255 scope global cni0  # <-- Here is the IP Address
       valid_lft forever preferred_lft forever
    inet6 fe80::7833:10ff:fef3:af83/64 scope link 
       valid_lft forever preferred_lft forever

```
> *ATTENTION:* If your local cluster IP is not `10.42.0.1` you have to adapt the service in `elasticsearch.yaml` accordingly
