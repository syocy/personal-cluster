CLUSTER = personal-cluster
CONTEXT = kind-$(CLUSTER)

## cluster

.PHONY: cluster-create
cluster-create:
	kind create cluster --config cluster.yaml

.PHONY: cluster-delete
cluster-delete:
	kind delete cluster --name $(CLUSTER)

.PHONY: cluster-pause
cluster-pause:
	docker pause $(CLUSTER)-control-plane

.PHONY: cluster-unpause
cluster-unpause:
	docker unpause $(CLUSTER)-control-plane

## redis

.PHONY: redis-apply
redis-apply:
	bash -c 'kubectl apply --context=$(CONTEXT) -f <(kustomize build redis)'

.PHONY: redis-delete
redis-delete:
	bash -c 'kubectl delete --context=$(CONTEXT) -f <(kustomize build redis)'

.PHONY: redis-restart
redis-restart:
	kubectl rollout restart deployment/redis

## postgres

.PHONY: postgres-apply
postgres-apply:
	bash -c 'kubectl apply --context=$(CONTEXT) -f <(kustomize build postgres)'

.PHONY: postgres-delete
postgres-delete:
	bash -c 'kubectl delete --context=$(CONTEXT) -f <(kustomize build postgres)'

.PHONY: postgres-restart
postgres-restart:
	kubectl rollout restart deployment/postgres

## scylla

.PHONY: scylla-apply
scylla-apply:
	bash -c 'kubectl apply --context=$(CONTEXT) -f <(kustomize build scylla)'

.PHONY: scylla-delete
scylla-delete:
	bash -c 'kubectl delete --context=$(CONTEXT) -f <(kustomize build scylla)'

.PHONY: scylla-restart
scylla-restart:
	kubectl rollout restart deployment/scylla
