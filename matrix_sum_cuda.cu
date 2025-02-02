#include <iostream>
#include "matrix_utils.h"

__global__ void sum_matrix(int* matrix_1, int* matrix_2, int* result) {
    int idx = threadIdx.x;
    result[idx] = matrix_1[idx] + matrix_2[idx];
}


int main(int argc, char** argv) {
    int dimension;
    
    std::cout << "Insert matrix dimension : ";
    std::cin >> dimension;
    std::cout << std::endl;

    int* matrix = new int[dimension * dimension];
    int* matrix_2 = new int[dimension * dimension];
    int* result = new int[dimension * dimension];

    int* matrix_1_gpu;
    int* matrix_2_gpu;
    int* result_gpu;

    std::cout << "Matrix 1: " << std::endl;
    ask_values(dimension, matrix);
    std::cout << "Matrix 2: " << std::endl;
    ask_values(dimension, matrix_2);

    print_matrix(dimension, matrix);
    std::cout << " + " << std::endl;
    print_matrix(dimension, matrix_2);
    std::cout << " = " << std::endl;
    
    cudaMalloc((void **)&matrix_1_gpu, dimension * dimension * sizeof(int));
    cudaMalloc((void **)&matrix_2_gpu, dimension * dimension * sizeof(int));
    cudaMalloc((void **)&result_gpu, dimension * dimension * sizeof(int));

    cudaMemcpy(matrix_1_gpu, matrix, dimension * dimension * sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(matrix_2_gpu, matrix_2, dimension * dimension * sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(result_gpu, result, dimension * dimension * sizeof(int), cudaMemcpyHostToDevice);

    sum_matrix<<<1, dimension * dimension>>>(matrix_1_gpu, matrix_2_gpu, result_gpu);
    cudaMemcpy(result, result_gpu, dimension * dimension * sizeof(int), cudaMemcpyDeviceToHost);

    print_matrix(dimension, result);

    cudaFree(matrix_1_gpu);
    cudaFree(matrix_2_gpu);
    cudaFree(result_gpu);

    delete[] matrix;
    delete[] matrix_2;
    delete[] result;
}