include(vcpkg_common_functions)

vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

if ((NOT (${TARGET_TRIPLET} MATCHES "x64")) OR (${TARGET_TRIPLET} MATCHES UWP))
	message(FATAL_ERROR "Foundational only supports x64 at this time.")
endif()

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO NovaMods/foundational
    REF ff60768054011ce6a436113ed830ed6e86b15c00
    SHA512 84e1eea981455e5f1f6c17fc7edffd895eb59de425e4dac3981523ea6c4a999940a9e0bcff1d3185ad6e036ed5c9cda340664421b20ee4fa6df9d02183adb95c
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DNOVA_PACKAGE=True
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/foundational RENAME copyright)

vcpkg_copy_pdbs()
