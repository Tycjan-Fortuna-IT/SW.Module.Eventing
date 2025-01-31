cmake_minimum_required(VERSION 3.16...3.26 FATAL_ERROR)

project(Eventing VERSION 0.2.1 LANGUAGES CXX)

include_directories(${PROJECT_SOURCE_DIR}/src)

file(GLOB_RECURSE HEADERS "src/Eventing/*.hpp")
file(GLOB_RECURSE HEADERS "src/Eventing/*.inl")
file(GLOB_RECURSE SOURCES "src/Eventing/*.cpp")

add_library(${PROJECT_NAME} STATIC ${HEADERS} ${SOURCES})

set(LOGGER_MODULE_DIR "../Logger/src")

if(WIN32)
    target_compile_definitions(Logger PUBLIC SW_PLATFORM_WINDOWS)
elseif(UNIX)
    target_compile_definitions(Logger PUBLIC SW_PLATFORM_LINUX)
endif()

target_include_directories(${PROJECT_NAME} PUBLIC ../Logger/src)
target_link_libraries(${PROJECT_NAME} Logger)
