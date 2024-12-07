DOCKER_IMAGE := "pprotein-deb"

docker_build:
	docker build -t $(DOCKER_IMAGE) .

build_pprotein_amd64:
	cd pprotein && docker run --rm -v $(PWD)/pprotein/:/tmp/pprotein \
	-v $(PWD)/pprotein/build.sh:/tmp/build.sh \
	-v $(PWD)/pprotein/pprotein.service:/tmp/pprotein.service \
	-v $(PWD)/pprotein/control.amd64:/tmp/control.amd64 \
	-t $(DOCKER_IMAGE)

build_pprotein_arm64:
	cd pprotein && docker run --rm -v $(PWD)/pprotein/:/tmp/pprotein \
	-v $(PWD)/pprotein/build.sh:/tmp/build.sh \
	-v $(PWD)/pprotein/pprotein.service:/tmp/pprotein.service \
	-v $(PWD)/pprotein/control.arm64:/tmp/control.arm64 \
	-t $(DOCKER_IMAGE) arm64

build_pprotein_agent_amd64:
	cd pprotein-agent && docker run --rm -v $(PWD)/pprotein-agent/:/tmp/pprotein \
	-v $(PWD)/pprotein-agent/build.sh:/tmp/build.sh \
	-v $(PWD)/pprotein-agent/pprotein-agent.service:/tmp/pprotein-agent.service \
	-v $(PWD)/pprotein-agent/control.amd64:/tmp/control.amd64 \
	-t $(DOCKER_IMAGE)

build_pprotein_agent_arm64:
	cd pprotein-agent && docker run --rm -v $(PWD)/pprotein-agent/:/tmp/pprotein \
	-v $(PWD)/pprotein-agent/build.sh:/tmp/build.sh \
	-v $(PWD)/pprotein-agent/pprotein-agent.service:/tmp/pprotein-agent.service \
	-v $(PWD)/pprotein-agent/control.arm64:/tmp/control.arm64 \
	-t $(DOCKER_IMAGE) arm64
