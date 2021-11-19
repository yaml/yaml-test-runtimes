ALL := go-yaml-test

build: $(ALL)

%: cmd/%/*.go
	go build -o $@ $^

clean:
	@rm -f $(ALL)
