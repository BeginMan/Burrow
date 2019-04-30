# Binary name
BINARY=burrow
VERSION="0.1"
# Builds the project
build:
		go build -o ${BINARY} -ldflags "-X main.version=${VERSION}"
		#go test -v
# Installs our project: copies binaries
install:
		go install
release:
		# Clean
		# Build for linux
		go clean
		CGO_ENABLED=0 GOOS=linux GOARCH=amd64  go build -ldflags "-X main.Version=${VERSION}"
		tar czvf ${BINARY}-linux64-${VERSION}.tar.gz ./${BINARY}

# Cleans our projects: deletes binaries
clean:
		go clean
		rm -rf *.gz

.PHONY:  clean build
