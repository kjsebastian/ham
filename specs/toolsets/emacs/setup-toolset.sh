#!/bin/bash

# toolset
export HAM_TOOLSET=EMACS
export HAM_TOOLSET_VER=23
export HAM_TOOLSET_NAME=emacs
export HAM_TOOLSET_DIR="${HAM_HOME}/toolsets/emacs"

export EMACS_EXE=emacs

# path setup
case $HAM_OS in
    NT*)
        export EMACS_EXE=emacs.exe
        export EMACS_DIR="${HAM_TOOLSET_DIR}/nt-x86/"
        export PATH="${EMACS_DIR}/bin":${PATH}
        if [ ! -e "$EMACS_DIR" ]; then
            toolset_dl emacs emacs_nt-x86
            if [ ! -e "$EMACS_DIR" ]; then
                echo "E/nt-x86 folder doesn't exist in the toolset"
                return 1
            fi
        fi
        ;;
    OSX*)
        ;;
    *)
        echo "E/Toolset: Unsupported host OS"
        return 1
        ;;
esac

VER="--- emacs ------------------------
`emacs --version | grep 'Emacs' | head -n 1`"
if [ $? != 0 ]; then
    echo "E/Can't get version."
    return 1
fi
export HAM_TOOLSET_VERSIONS="$HAM_TOOLSET_VERSIONS
$VER"
