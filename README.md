AARCH64 port of Universal Scene Description
===========================================

This repo is a aarch64 port of USD library.
Some features are disabled.

Since USD depends many libraries, I recommend to use https://github.com/syoyo/USD-build-aarch64 to build USD.

Build with cross compilation
----------------------------

Requirements

* CMake
* TBB
* OpenSubdiv
* (optional) Ptex( https://github.com/syoyo/ptex-aarch64.git `aarch64` branch )


**Build TBB in cross compiling**

```
$ CC=aarch64-linux-gnu-gcc-5 CXX=aarch64-linux-gnu-g++-5 make arch=arm64
```

Then copy `include` folder to `$TBBROOT`(You can set arbitrary folder name), copy `*.so` to `$TBBROOT/lib`.

```
$TBBROOT/include
$TBBROOT/lib
```

**Build OpenSubdiv in cross compiling**

Build and install this repo : https://github.com/syoyo/OpenSubdiv-aarch64

**Build USD**

Edit path in `scripts/bootstrap-aarch64-gcc-cross-linux.sh`.
Also set Ptex path(optional), then

```
$ ./scripts/bootstrap-aarch64-gcc-cross-linux.sh`
```


Following is the original USD README.


Universal Scene Description
===========================

Universal Scene Description (USD) is an efficient, scalable system for
authoring, reading, and streaming time-sampled scene description for
interchange between graphics applications.

For more details, please visit the web site [here](http://openusd.org).

Build Status
------------

|       | master | dev |
| ----- | ------ | --- |
| Linux/macOS | [![Build Status](https://travis-ci.com/PixarAnimationStudios/USD.svg?branch=master)](https://travis-ci.com/PixarAnimationStudios/USD) | [![Build Status](https://travis-ci.com/PixarAnimationStudios/USD.svg?branch=dev)](https://travis-ci.com/PixarAnimationStudios/USD) |

Additional Documentation
------------------------

* [User Documentation and Tutorials](http://openusd.org/docs/index.html)
* [API Documentation](http://openusd.org/docs/api/index.html)
* [Advanced Build Configuration](BUILDING.md)

Getting Help
------------

Need help understanding certain concepts in USD? See
[Getting Help with USD](http://openusd.org/docs/Getting-Help-with-USD.html) or
visit our [forum](https://groups.google.com/forum/#!forum/usd-interest).

If you are experiencing undocumented problems with the software, please
[file a bug](https://github.com/PixarAnimationStudios/USD/issues/new).

Supported Platforms
-------------------

USD is currently supported on Linux platforms and has been built and tested
on CentOS 7 and RHEL 7.

We are actively working on porting USD to both Windows and Mac platforms.
Support for both platforms should be considered experimental at this time.
Currently, the tree will build on Mac and Windows, but only limited testing
has been done on these platforms.

Dependencies
------------

The following dependencies are required:
 - C++ compiler
 - C compiler
 - [CMake](https://cmake.org/documentation/)
 - [Boost](https://boost.org)
 - [Intel TBB](https://www.threadingbuildingblocks.org/)

The following dependencies are optional:
 - [Python](https://python.org)

See [3rd Party Library and Application Versions](VERSIONS.md) for version information.

Additional dependencies are required for the following components. These 
components may be disabled at build-time, for further details see
[Advanced Build Configuration](BUILDING.md).

**Imaging and USD Imaging**

The following dependencies are required:
 - [OpenSubdiv](https://github.com/PixarAnimationStudios/OpenSubdiv)

The following dependencies are optional:

 - [GLEW](http://glew.sourceforge.net/)
 - [OpenEXR](http://www.openexr.com)
 - [OpenImageIO](https://sites.google.com/site/openimageio/home)
 - [OpenColorIO](http://opencolorio.org/)
 - [OSL (OpenShadingLanguage)](https://github.com/imageworks/OpenShadingLanguage)
 - [Ptex](http://ptex.us/)                          

**usdview**

The following dependencies are required:

 - [PySide](http://wiki.qt.io/PySide) or [PySide2](http://wiki.qt.io/PySide2) (experimental)
 - [PyOpenGL](https://pypi.python.org/pypi/PyOpenGL/)

Getting and Building the Code
-----------------------------

The simplest way to build USD is to run the supplied ```build_usd.py```
script. This script will download required dependencies and build
and install them along with USD in a given directory.

Follow the instructions below to run the script with its default behavior,
which will build the USD core libraries, Imaging, and USD Imaging components.
For more options and documentation, run the script with the ```--help```
parameter.

See [Advanced Build Configuration](BUILDING.md) for examples and
additional documentation for running cmake directly.

#### 1. Install prerequisites (see [Dependencies](#dependencies) for required versions)

- Required:
    - C++ compiler:
        - gcc
        - Xcode
        - Microsoft Visual Studio
    - NASM (required for Imaging on Windows)
    - CMake
- Optional (Can be ignored by passing `--no-python` as an argument to `build_usd.py`)
    - Python (required for [bindings and tests](BUILDING.md#python))
    - PyOpenGL (required for [usdview](BUILDING.md#usd-imaging))
    - PySide or PySide2 (experimental) (required for [usdview](BUILDING.md#usd-imaging))

#### 2. Download the USD source code

You can download source code archives from [GitHub](https://www.github.com/PixarAnimationStudios/USD) or use ```git``` to clone the repository.

```
> git clone https://github.com/PixarAnimationStudios/USD
Cloning into 'USD'...
```

#### 3. Run the script

##### Linux:

For example, the following will download, build, and install USD's dependencies,
then build and install USD into ```/usr/local/USD```.

```
> python USD/build_scripts/build_usd.py /usr/local/USD
```

##### MacOS:

In a terminal, run ```xcode-select``` to ensure command line developer tools are
installed. Then run the script.

For example, the following will download, build, and install USD's dependencies,
then build and install USD into ```/opt/local/USD```.

```
> python USD/build_scripts/build_usd.py /opt/local/USD
```

##### Windows:

Launch the "Developer Command Prompt" for your version of Visual Studio and
run the script in the opened shell. Make sure to use the 64-bit (x64) command
prompt and not the 32-bit (x86) command prompt.  (Note if you're trying to
build with Visual Studio 2017, use the "x86 Native Tools Command Prompt for VS
2017").

See https://docs.microsoft.com/en-us/dotnet/framework/tools/developer-command-prompt-for-vs for more details.

For example, the following will download, build, and install USD's dependencies,
then build and install USD into ```C:\Program Files\USD```.

```
C:\> python USD\build_scripts\build_usd.py "C:\Program Files\USD"
```

#### 4. Try it out

Set the environment variables specified by the script when it finishes and
launch ```usdview``` with a sample asset.

```
> usdview extras/usd/tutorials/convertingLayerFormats/Sphere.usda
```

Contributing
------------

If you'd like to contribute to USD (and we appreciate the help!), please see
the [Contributing](http://openusd.org/docs/Contributing-to-USD.html) page in the
documentation for more information.
