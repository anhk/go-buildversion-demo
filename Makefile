export GOPROXY=https://goproxy.cn,direct
export GO111MODULE=on

OBJ = main

MajorVersion=V1.0
BuildVersion=${MajorVersion}.$(shell date +%Y%m%d%H%M%S)

default: $(OBJ)

$(OBJ):
	go build -gcflags "-N -l" -ldflags="-X main.BuildVersion=${BuildVersion}" -o $@ .

clean:
	rm -fr $(OBJ)

-include .deps

dep:
	echo -n "$(OBJ):" > .deps
	find . -name '*.go' | awk '{print $$0 " \\"}' >> .deps
	echo "" >> .deps