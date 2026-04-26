# GPU-Sorting-Capstone

GPU-accelerated sorting using NVIDIA Thrust, compiled with `nvcc`.

## Repository Structure

```
GPU-Sorting-Capstone/
├── src/
│   └── thrustSort.cu   # CUDA/Thrust sorting implementation
├── bin/                # Compiled executables (git-ignored, except .gitkeep)
├── Makefile            # Build system
├── .gitignore
└── README.md
```

## Prerequisites

| Requirement | Notes |
|---|---|
| NVIDIA GPU | Kepler (sm_35) or newer |
| CUDA Toolkit | 11.0 or newer (`nvcc` must be on `PATH`) |
| GNU Make | Any modern version |

## How to Build and Run

### Build

```bash
# From the repository root
make
```

This compiles `src/thrustSort.cu` with `nvcc` (C++17) and places the
executable at **`bin/thrustSort`**.

### Run

```bash
# Sort 1,048,576 integers (default)
./bin/thrustSort

# Sort a custom number of integers (e.g. 10 million)
./bin/thrustSort 10000000
```

### Clean

```bash
make clean
```

This removes all compiled files from the `bin/` folder.

## Expected Output

```
GPU Sorting with NVIDIA Thrust
Sorting 1048576 random integers...
Sort complete in X.XX ms
Verification: PASSED
First 5 elements: 0 3 7 12 18
Last  5 elements: 2147483603 2147483617 2147483628 2147483637 2147483641
```