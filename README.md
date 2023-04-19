# personal-cluster

A local Kubernetes cluster.

## Prerequisites

* kubectl
* [kustomize v5+](https://github.com/kubernetes-sigs/kustomize)
* [kind](https://kind.sigs.k8s.io/)

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
