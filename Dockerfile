FROM ubuntu:24.04

RUN apt update -y
RUN apt install -y fakeroot curl

ENTRYPOINT ["bash", "/tmp/build.sh"]
CMD ["amd64"]
