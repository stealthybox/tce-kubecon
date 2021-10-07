TAG := latest
REPO := ghcr.io/stealthybox/tce-educates

IMG := $(REPO):$(TAG)

build:
	docker build . -t $(IMG)

k3d-load:
	k3d image import $(IMG)

push:
	docker push $(IMG)

deploy-k8s:
	kubectl apply -f ./resources/
