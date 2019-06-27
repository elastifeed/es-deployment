# S3 Storage provider
The S3 provider is based on [rook-ceph](https://rook.io). Make sure to have it installed
on your cluster using the default (!) namespace

## Create deployment
> **Note:** There is currently a [bug](https://github.com/rook/rook/issues/2490) in rook which explains the sleep inbetween the two commands.
`kc apply -f s3_ceph.yaml && sleep 120 && kc apply -f s3_ceph_user.yaml`

## Retrieve needed information
> We are exposing the S3 API via a nodeport which is assigned by the kubernetes controller.
Retrieve the port:
```bash
kubectl describe -n rook-ceph service rook-ceph-rgw-s3-store-external | grep "NodePort:" | awk '{print $3}'
```
> User Credentials are stored in a SecretMap.
Extracting credentials:
```bash
kubectl -n rook-ceph get secret rook-ceph-object-user-s3-store-s3-user -o yaml | grep AccessKey | awk '{print $2}' | base64 --decode
kubectl -n rook-ceph get secret rook-ceph-object-user-s3-store-s3-user -o yaml | grep SecretKey | awk '{print $2}' | base64 --decode
```

## Creating the needed bucket (this is not automated atm)
