.PHONY: build
build:
	CARGO_MANIFEST_DIR=. \
  TARGET=x86_64-unknown-linux-gnu \
  PROFILE=debug \
  OUT_DIR=target/out \
  pyoxidizer run-build-script build.rs
	PYOXIDIZER_ARTIFACT_DIR=$(shell pwd)/target/out \
  PYO3_CONFIG_FILE=$(shell pwd)/target/out/pyo3-build-config-file.txt \
  cargo build \
    --no-default-features \
    --features "build-mode-prebuilt-artifacts global-allocator-jemalloc allocator-jemalloc"
