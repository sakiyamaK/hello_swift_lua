# Define the commands to use for build and run
SWIFT_BUILD = arch -x86_64 swift build
SWIFT_RUN = arch -x86_64 swift run

# Default target
all: build

# Build target
build:
	$(SWIFT_BUILD)

# Run target
run:
	$(SWIFT_RUN)

# Clean target
clean:
	$(SWIFT_BUILD) --clean

# Test target (if you have tests)
test:
	$(SWIFT_BUILD) --build-tests && arch -x86_64 swift test

.PHONY: all build run clean test
