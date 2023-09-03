FROM ubuntu:latest
LABEL authors="chihosong"

ENTRYPOINT ["top", "-b"]