cmake_minimum_required(VERSION 3.4.1)  # for example

# Declares and names the project.

project("life_peak_lib")

add_library(life_peak_lib

# Sets the library as a shared library.
SHARED

# Provides a relative path to your source file(s).
        src/main/cpp/life_peak_lib.c)
