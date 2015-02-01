VERSION=1.0.5

all: deps
	go build .

deps:
	go get -u github.com/gorilla/pat

.dist-deps:
	go get -u github.com/mitchellh/gox
	gox -build-toolchain
	touch .dist-deps

dist: .dist-deps deps
	-rm -rf ./.dist-build
	gox -osarch="linux/amd64" -output="build/ssbs/{{.Dir}}_{{.OS}}_{{.Arch}}" .
	mkdir ./.dist-build
	cp ./build/ssbs/ssbs_linux_amd64 ./.dist-build/ssbs
	cd ./.dist-build; zip ssbs.zip ssbs
	mv ./.dist-build/ssbs.zip ssbs-$(VERSION).zip
	rm -rf ./.dist-build

.PHONY: all dist deps
