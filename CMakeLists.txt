cmake_minimum_required(VERSION 3.18) 

project(MatrixSumCuda LANGUAGES CXX CUDA)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(SOURCES
    matrix_sum_cuda.cu
    matrix_utils.cpp
)

add_executable(MatrixSumCuda ${SOURCES})

set_target_properties(MatrixSumCuda PROPERTIES
    CUDA_SEPARABLE_COMPILATION ON
)
