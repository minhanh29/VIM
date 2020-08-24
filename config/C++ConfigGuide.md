## Course Link
https://www.youtube.com/playlist?list=PL_c9BZzLwBRJVJsIfe97ey45V4LP_HXiG

## When working with vectors
compile: g++ -o name name.cpp -std=c++11

## Compiling mutiple files (classes)
g++ -o [Program] [DriverFile].cpp [ClassFile].cpp

## Install ccls
brew install llvm
git clone --depth=1 --recursive https://github.com/MaskRay/ccls
cd ccls
cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/usr/local/Cellar/llvm/[version]/
(brew info llvm to see version)
cmake --build Release --target install

## Configure .ccls
Run g++ -E -x c++ - -v < /dev/null in your terminal and you’ll see a list of include paths that the compiler searches. They are between #include <...> search starts here: and End of search list.. Now put them into your .ccls file as -isystem options (unlike -I, the errors and warnings in the header files found in -isystem paths are ignored by the syntax checker).

-isysroot/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include
-isystem
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1
-isystem
/usr/local/include
-isystem
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/include
-isystem
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
-isystem
/usr/include
-isystem
/System/Library/Frameworks (framework directory)
-isystem
/Library/Frameworks (framework directory)
-std=c++14
-stdlib=libc++
