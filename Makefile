PACKAGE_ROOT=github.com/vodaza36/go-aws
BIN=./bin
DIST=./dist

all: clean build dist lambda-update

build:
	env GOOS=linux GOARCH=amd64 go build -o $(BIN)/main $(PACKAGE_ROOT)/books

dist: 
	mkdir $(DIST)
	zip -j $(DIST)/main.zip $(BIN)/main

clean:
	rm -rf $(BIN) $(DIST)

lambda-update:
	aws lambda update-function-code --function-name books --zip-file fileb:///Users/xhocht/Development/go/src/github.com/vodaza36/go-aws/dist/main.zip
