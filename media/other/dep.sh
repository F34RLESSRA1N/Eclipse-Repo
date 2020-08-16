#!/bin/bash

cd ~/Desktop/
rm -rf libimobiledevice
mkdir libimobiledevice
cd libimobiledevice

which brew > /dev/null
if [ $? -ne 0 ]; then
    echo "Presiona ENTER para instalar Homebrew: "
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

xcode-select --install

brew install libtool
brew install automake
brew install curl
brew reinstall libxml2
echo 'export PATH="/usr/local/opt/libxml2/bin:$PATH"' >> ~/.zshrc
export LDFLAGS="-L/usr/local/opt/libxml2/lib"
export CPPFLAGS="-I/usr/local/opt/libxml2/include"
export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"
brew install gnutls
brew install libgcrypt
brew reinstall openssl
echo 'export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"' >> ~/.bash_profile
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
brew install pkg-config
brew link pkg-config
brew install libusbmuxd https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb

echo "Instalando libplist: "
git clone https://github.com/libimobiledevice/libplist.git
cd libplist
./autogen.sh --without-cython
make
make install
cd ..

echo "Instalando Usbmuxd: "
git clone https://github.com/libimobiledevice/libusbmuxd.git
cd libusbmuxd
./autogen.sh
make
make install
cd ..

echo "Instalando libimobiledevice: "
git clone https://github.com/libimobiledevice/libimobiledevice.git
cd libimobiledevice
./autogen.sh --without-cython --disable-openssl
make
make install
cd ..

echo "Instalando libideviceactivation: "
git clone https://github.com/libimobiledevice/libideviceactivation.git
cd libideviceactivation
./autogen.sh
make
make install
cd ..

echo "======= F34RLESSRA1N ======="
