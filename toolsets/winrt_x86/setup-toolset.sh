. ham-toolset-import.sh xslt_tools
. ham-toolset-import.sh msvc_11_x86
export LIBPATH="`nativedir \"${WINSDKDIR}/References/CommonConfiguration/Neutral\"`;`nativedir \"${MSVCDIR}/vcpackages\"`"
export HAM_TOOLSET_IS_SETUP_MSVC_11_X86=
export HAM_TOOLSET_IS_SETUP_WINRT_X86=1
export HAM_TOOLSET=VISUALC
export HAM_TOOLSET_VER=11
export HAM_TOOLSET_NAME=winrt_x86
export HAM_TOOLSET_DIR=${HAM_HOME}/toolsets/${HAM_TOOLSET_NAME}