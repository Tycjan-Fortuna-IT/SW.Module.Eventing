cmake_minimum_required(VERSION 3.30 FATAL_ERROR)

project(SW.Module.Eventing VERSION 0.2.2 LANGUAGES CXX)

include_directories(${PROJECT_SOURCE_DIR}/src)

file(GLOB_RECURSE HEADERS "src/Eventing/*.hpp")
file(GLOB_RECURSE HEADERS "src/Eventing/*.inl")
file(GLOB_RECURSE SOURCES "src/Eventing/*.cpp")

add_library(${PROJECT_NAME} STATIC ${HEADERS} ${SOURCES})

target_include_directories(${PROJECT_NAME} PUBLIC ../SW.Module.Logger/src)
target_link_libraries(${PROJECT_NAME} SW.Module.Logger)
