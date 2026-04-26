# Capstone: GPU-Accelerated Sorting using NVIDIA Thrust

**Project Description:**
For my capstone project, I wanted to focus on the performance acceleration capabilities of GPUs for fundamental computer science algorithms—specifically, sorting large datasets. I utilized the NVIDIA Thrust library to implement a Radix Sort and compared its parallel execution speed to traditional single-threaded CPU sorting limits.

**Development Environment:**
This project modifies and expands upon the Thrust Sorting laboratory provided in the "CUDA Advanced Libraries" course. It was developed and executed within the Coursera Jupyter/Terminal lab environment.

**Code Description:**
The core logic resides in `thrustSort.cu`. 
1. The program generates large vectors of random floating-point keys and integer values.
2. The data is copied from the Host to the Device using `thrust::device_vector`.
3. `thrust::sort` is invoked to perform a highly optimized parallel sort directly on the GPU.
4. The sorted data is verified using `thrust::is_sorted`, and the execution throughput (MElements/s) is logged.

**Proof of Execution:**
Please see the attached `output.txt` file in this repository. It contains the terminal output proving the successful parallel sorting of 1,024 elements across 10 iterations, including the timing and throughput metrics.
