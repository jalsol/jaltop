CC=g++
CFLAGS=-std=c++20 -Wall -Wextra -Os
INCLUDE=-I external/cpp-httplib -I external/libjaltop/include
PKG_DIR=build/jaltop_0.1-1

all: libjaltop
	$(CC) $(CFLAGS) $(INCLUDE) -o build/jaltop src/main.cpp -Lbuild -ljaltop

libjaltop:
	cd external/libjaltop; mkdir -p build; make
	cp external/libjaltop/build/libjaltop.so build/

clean:
	rm -r build/*

deb: all
	mkdir -p $(PKG_DIR)/usr/bin/
	mkdir -p $(PKG_DIR)/usr/lib/
	cp build/jaltop $(PKG_DIR)/usr/bin/jaltop
	cp external/libjaltop/build/libjaltop.so $(PKG_DIR)/usr/lib/libjaltop.so
	mkdir -p $(PKG_DIR)/etc/systemd/system/
	cp misc/jaltop.service $(PKG_DIR)/etc/systemd/system/jaltop.service
	mkdir -p $(PKG_DIR)/DEBIAN/
	cp misc/control $(PKG_DIR)/DEBIAN/control
	cd build; dpkg-deb --build jaltop_0.1-1

