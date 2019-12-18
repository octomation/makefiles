.PHONY: build
build:
	@egg --build
	@mv bin/* $(BINPATH) && rm -rf bin

.PHONY: egg
egg:
	@go get -d -mod= -u github.com/kamilsk/egg
	@go build -mod= -o $(BINPATH)/egg github.com/kamilsk/egg
