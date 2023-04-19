# personal-cluster

## Prerequisites

* kubectl
* kustomize v5+
* kind

## Cluster Operation

Create

```shell
make cluster-create
```

Delete

```shell
make cluster-delete
```

Pause

```shell
make cluster-pause
```

Unpause

```shell
make cluster-unpause
```

## Services in Cluster

### Redis

Create & Test

```shell
make redis-apply
redis-cli -c info
```

Delete

```shell
make redis-delete
```

### Postgres

Create & Test

```shell
make postgres-apply
psql -h 0.0.0.0 -U postgres -c "\\l" # default password is "pass"
```

Delete

```shell
make postgres-delete
```

## Troubleshoot

`kubectl get`

```shell
kubectl get deployment
kubectl get pod
kubectl get pv
kubectl get pvc
```

`kubectl describe`

```shell
kubectl describe pod redis-xxxxx
```

`kubectl logs`

```shell
kubectl logs postgres-xxxxx
```

`kubectl exec`

```shell
kubectl exec -it postgres-xxxxx -- /bin/bash
```
