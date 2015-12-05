#!/bin/bash

# path setup
case $HAM_OS in
    NT*)
        . ham-toolset-import.sh xslt_tools
        if [ $? != 0 ]; then return 1; fi

        ### We're using VS 2010 because VS 2012 **CANNOT** target WinXP ###
        # MSVCDIR="`unxpath "$PROGRAMFILES\\Microsoft Visual Studio 11.0\\VC"`"
        # if [ -e "$MSVCDIR/bin/cl.exe" ]; then
            # echo "I/Default Toolset: Detected VS2012"
            # . ham-toolset-import.sh msvc_11_x86
        # else
            echo "I/Default Toolset: Using VC10 legacy package"
            . ham-toolset-import.sh msvc_10_x86
            if [ $? != 0 ]; then return 1; fi
        # fi
        ;;
    OSX*)
        . ham-toolset-import.sh xslt_tools
        . ham-toolset-import.sh clang_33
        # Force to X86 build atm, X64 hasn't been tested yet
        export OSPLAT=X86
        ;;
    LINUX)
        . ham-toolset-import.sh xslt_tools
        . ham-toolset-import.sh gcc_470
        ;;
    *)
        echo "E/Toolset: Unsupported host OS"
        return 1
        ;;
esac
