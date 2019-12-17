.PHONY: deps
deps:
	@go mod tidy && go mod vendor && go mod verify

.PHONY: update
update:
	@go get -mod= -u
