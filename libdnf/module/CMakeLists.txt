add_subdirectory(modulemd)

set(MODULE_SOURCES
    ${MODULE_SOURCES}
    ${CMAKE_CURRENT_SOURCE_DIR}/ModulePackageContainer.cpp
    PARENT_SCOPE
)
