#!/usr/bin/env bash

set -eu -o pipefail

IMAGE="jaedle/concourse-docker-in-docker"

build() {
  docker image build -t "$IMAGE:test" .
}

push() {
  docker image tag "$IMAGE:test" "$IMAGE:latest"
  docker image push "$IMAGE:latest"
}

build
push
