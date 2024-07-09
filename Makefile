export GOPROXY=https://goproxy.cn,direct
export GO111MODULE=on

OBJ = buildversion-demo

VERSION ?= v0.0.1-test
GIT_BRANCH=$(shell git rev-parse --abbrev-ref HEAD)
GO_VERSION=$(shell go version  | awk '{print $$3}')
BUILD_TIME=$(shell date +%FT%T%z)
OS_ARCH=$(shell go version  | awk '{print $$4}')
GIT_COMMIT=$(shell git rev-parse --short HEAD)

LDFLAGS=-ldflags "-X github.com/anhk/go-buildversion-demo/pkg/version.Version=${VERSION} \
 -X github.com/anhk/go-buildversion-demo/pkg/version.GoVersion=${GO_VERSION} \
 -X github.com/anhk/go-buildversion-demo/pkg/version.BuildTime=${BUILD_TIME} \
 -X github.com/anhk/go-buildversion-demo/pkg/version.GitBranch=${GIT_BRANCH} \
 -X github.com/anhk/go-buildversion-demo/pkg/version.GitCommit=${GIT_COMMIT} "

default: $(OBJ)

$(OBJ):
	go build -gcflags "-N -l"  ${LDFLAGS} -o $@ .

clean:
	rm -fr $(OBJ)

