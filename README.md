# GameShell Cross Compiling

![gameshell.gif](gameshell.gif)

> GameShell running [ruby](https://github.com/Ruenzuo/ruby) PlayStation emulator, a C++ SDL2 OpenGL 3.3 project.

### [crosstool-NG](http://crosstool-ng.github.io/)

Simply follow the instructions on how to set up a toolchain from their Documentation page (pages 1-4). If you’re unsure about how to configure crosstool-ng, you can use my configuration available [here](https://gist.github.com/UnsafePointer/04b9daddb946583ed289e0fa0e9c190f). Some useful bits:

* GameShell machine name is `arm-linux-gnueabihf`
* Target OS is `linux`
* Version is `4.20.8` (based on clockworkOS image 0.3)
* glibc version is `2.24`

### SDL2

Once you have a cross compile toolchain (building takes a while), you’re ready to cross compile SDL2. Get the source code and run the following for the configuration and installation:

```bash
$ ./configure --host=armv7l-unknown-linux-gnueabihf --build=x86_64-linux-gnu --disable-pulseaudio --prefix=/usr
$ make
$ chmod -R +w ~/x-tools/armv7l-unknown-linux-gnueabihf/armv7l-unknown-linux-gnueabihf/sysroot
$ make DESTDIR=~/x-tools/armv7l-unknown-linux-gnueabihf/armv7l-unknown-linux-gnueabihf/sysroot install
$ chmod -R -w ~/x-tools/armv7l-unknown-linux-gnueabihf/armv7l-unknown-linux-gnueabihf/sysroot
```

### Compiling and running

This will only work if you set the GPU driver to **Fbturbo**.

```bash
$ make
$ scp bin/gs-cross-compile cpi@x.x.x.x:~
$ DISPLAY=:0 ./gs-cross-compile
```
