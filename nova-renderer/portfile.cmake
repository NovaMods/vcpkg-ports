include(vcpkg_common_functions)

vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO NovaMods/nova-renderer
    REF a746220abc85e25fe3a92d90747b805ebf65dd56
    SHA512 a950a2613fe91134e78cf52166331d5386692b2e8c64e158d9e21f0cbf2a3365b47d50b1338f75a90227bfe4912d077f677c9ebde8e17e9aeea940875eaff088
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

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/nova-renderer RENAME copyright)

vcpkg_copy_pdbs()
