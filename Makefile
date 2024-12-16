.PHONY: build run debs clean

PROJECTNAME=$(shell basename "$(PWD)")

GOCMD=go
GOBUILD=$(GOCMD) build
GOTEST=$(GOCMD) test
GOMOD=$(GOCMD) mod
GOBASE=$(shell pwd)
GOPATH=$(GOBASE)/vendor
GOBIN=$(GOBASE)/bin
GOFILES=$(wildcard *.go)

BINDIR=bin
CLI_BINARY=$(BINDIR)/task-cli

STDERR=/tmp/.$(PROJECTNAME)-stderr.txt
PID=/tmp/.$(PROJECTNAME)-api-server.pid

MAKEFLAGS += --silent

build: $(BINDIR)
	$(GOBUILD) -o $(CLI_BINARY) ./cmd/cli/main.go

$(BINDIR):
	mkdir -p $(BINDIR)

run: build
	./$(CLI_BINARY)

deps:
	$(GOMOD) download
	$(GOMOD) tidy

clean:
	rm -rf $(BINDIR)
