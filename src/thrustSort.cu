// thrustSort.cu
// GPU-accelerated sorting using NVIDIA Thrust

#include <thrust/device_vector.h>
#include <thrust/host_vector.h>
#include <thrust/sort.h>
#include <thrust/generate.h>
#include <thrust/random.h>

#include <iostream>
#include <cstdlib>
#include <ctime>

int main(int argc, char* argv[]) {
    // Default number of elements to sort
    const int N = (argc > 1) ? std::atoi(argv[1]) : 1 << 20; // 1M elements

    std::cout << "GPU Sorting with NVIDIA Thrust\n";
    std::cout << "Sorting " << N << " random integers...\n";

    // Generate random data on the host
    thrust::host_vector<int> h_vec(N);
    thrust::default_random_engine rng(42);
    thrust::uniform_int_distribution<int> dist(0, INT_MAX);
    thrust::generate(h_vec.begin(), h_vec.end(), [&]() { return dist(rng); });

    // Copy data to the device
    thrust::device_vector<int> d_vec = h_vec;

    // Sort on the GPU
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);

    cudaEventRecord(start);
    thrust::sort(d_vec.begin(), d_vec.end());
    cudaEventRecord(stop);
    cudaEventSynchronize(stop);

    float milliseconds = 0.0f;
    cudaEventElapsedTime(&milliseconds, start, stop);

    cudaEventDestroy(start);
    cudaEventDestroy(stop);

    // Copy sorted data back to the host
    thrust::copy(d_vec.begin(), d_vec.end(), h_vec.begin());

    // Verify the result is sorted
    bool sorted = thrust::is_sorted(h_vec.begin(), h_vec.end());

    std::cout << "Sort complete in " << milliseconds << " ms\n";
    std::cout << "Verification: " << (sorted ? "PASSED" : "FAILED") << "\n";

    // Print first and last few elements
    std::cout << "First 5 elements: ";
    for (int i = 0; i < 5 && i < N; ++i) {
        std::cout << h_vec[i] << " ";
    }
    std::cout << "\nLast  5 elements: ";
    for (int i = std::max(0, N - 5); i < N; ++i) {
        std::cout << h_vec[i] << " ";
    }
    std::cout << "\n";

    return sorted ? EXIT_SUCCESS : EXIT_FAILURE;
}
