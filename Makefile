br: b ## Build and Run
	@echo "Building and Running project..."
	@OS="$(shell uname -s)"; \
	if [ "$$OS" = "Linux" ]; then \
		flutter run -d linux; \
	elif [ "$$OS" = "Darwin" ]; then \
		flutter run -d macos; \
	elif [ "$$OS" = "MSYS_NT" ]; then \
		flutter run -d windows; \
	else \
		echo "Unsupported operating system: $$OS"; \
	fi

b: f ## Build
	@echo "Building project..."
	@cmake -S . -B build && $(MAKE) -C build
	@OS="$(shell uname -s)"; \
	if [ "$$OS" = "Linux" ]; then \
		flutter build linux --debug; \
	elif [ "$$OS" = "Darwin" ]; then \
		flutter build macos --debug; \
	elif [ "$$OS" = "MSYS_NT" ]; then \
		flutter build windows --debug; \
	else \
		echo "Unsupported operating system: $$OS"; \
	fi

# Format
f:
	clear
	@echo "Formatting source files..."
	@clang-format -i src/*.c; true

# Lint
l:
	clear
	@echo "Linting source files..."
	@clang-tidy src/low.c -- -Iinclude \
	| grep src/*.c; true

t: ## Test
	clear
	@echo "Configuring the project with tests..."
	@cmake -DBUILD_TESTS=ON -S . -B build/tests  # Configure the project and tests in a separate directory
	@echo "Building test executable..."
	@cmake --build build/tests --target test_low  # Build tests
	clear
	@echo "Running tests..."
	@ctest --output-on-failure --test-dir build/tests -L low_tests

g: ## Debug
	clear
	@gdb -ex "shell clear"

c: ## Clean
	clear
	@rm -rf build || clear
	@flutter clean
	clear
	@echo "Project cleaned."
	@sleep .5
	clear

# Help
h:
	clear
	@echo ''
	@grep -E '^[ a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
	awk 'BEGIN {FS = ":.*?## "}; \
	{printf "\033[33m%-20s\033[0m %s\n", $$1, $$2}'
	@echo ''
