#include "matrix_utils.h"
#include <iostream>

void print_matrix(int dimension, int* matrix) {
    for(int i = 0; i < dimension; i++) {
        for(int j = 0; j < dimension; j++) {
            std::cout << matrix[i * dimension + j] << " ";
        }
        std::cout << std::endl;
    }
}

void ask_values(int dimension, int* matrix) {
    for (int i = 0; i < dimension; i++) {
        for (int j = 0; j < dimension; j++) {
            std::cout << "Insert value at (" << i << ", " << j << ") : ";
            std::cin >> matrix[i * dimension + j];
            std::cout << std::endl;
        }
    }
}