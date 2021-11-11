.PHONY: all clean

GO_BINARIES=go-yaml-test

all: $(GO_BINARIES)

%: cmd/%/*.go
	go build -o $@ $^

clean:
	@rm -f $(GO_BINARIES)
