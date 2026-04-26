# ============================================================
# Makefile for GPU-Sorting-Capstone
# Compiler: nvcc (NVIDIA CUDA Compiler)
# Standard: C++17
# ============================================================

NVCC        := nvcc
CXX_STD     := --std=c++17

# Optimization & architecture flags
NVCCFLAGS   := $(CXX_STD) -O2 -arch=native --extended-lambda

# Directories
SRC_DIR     := src
BIN_DIR     := bin

# Source & target
SRC         := $(SRC_DIR)/thrustSort.cu
TARGET      := $(BIN_DIR)/thrustSort

# ── Default target ────────────────────────────────────────────
.PHONY: all clean

all: $(BIN_DIR) $(TARGET)

# Create the bin/ directory if it does not exist
$(BIN_DIR):
	mkdir -p $(BIN_DIR)

# Compile the CUDA source and place the binary in bin/
$(TARGET): $(SRC) | $(BIN_DIR)
	$(NVCC) $(NVCCFLAGS) -o $@ $<

# ── Clean target ──────────────────────────────────────────────
clean:
	rm -f $(BIN_DIR)/*
