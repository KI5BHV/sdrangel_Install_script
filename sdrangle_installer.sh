
USER=$(whoami)
PROC=$(nproc) 
#PROC=2

# remove all other sdrangel
sudo apt remove sdrangel
sudo snap remove sdrangel 


# making direcroties
sudo mkdir -p /opt/build
sudo chown $USER:$USER /opt/build
sudo mkdir -p /opt/install
sudo chown $USER:$USER /opt/install


# install prerequisrites
sudo apt-get update && sudo apt-get -y install git cmake g++ pkg-config autoconf automake libtool libfftw3-dev libusb-1.0-0-dev libusb-dev qt5-default qtbase5-dev qtchooser libqt5multimedia5-plugins qtmultimedia5-dev libqt5websockets5-dev qttools5-dev qttools5-dev-tools libqt5opengl5-dev qtbase5-dev libboost-all-dev libasound2-dev pulseaudio libopencv-dev libxml2-dev bison flex ffmpeg libavcodec-dev libavformat-dev libopus-dev



# CM265cc
cd /opt/build
git clone https://github.com/f4exb/cm256cc.git
cd cm256cc
#git reset --hard f21e8bc1e9afdb0b28672743dcec111aec1d32d9
mkdir build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/opt/install/cm256cc ..
make -j $PROC install



#MBElib
cd /opt/build
git clone https://github.com/szechyjs/mbelib.git
cd mbelib
#git reset --hard 9a04ed5c78176a9965f3d43f7aa1b1f5330e771f
mkdir build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/opt/install/mbelib ..
make -j $PROC install


#SerialDV
cd /opt/build
git clone https://github.com/f4exb/serialDV.git
cd serialDV
#git reset --hard "v1.1.4"
mkdir build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/opt/install/serialdv ..
make -j $PROC install


#DSDcc
cd /opt/build
git clone https://github.com/f4exb/dsdcc.git
cd dsdcc
#git reset --hard "v1.8.6"
mkdir build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/opt/install/dsdcc -DUSE_MBELIB=ON -DLIBMBE_INCLUDE_DIR=/opt/install/mbelib/include -DLIBMBE_LIBRARY=/opt/install/mbelib/lib/libmbe.so -DLIBSERIALDV_INCLUDE_DIR=/opt/install/serialdv/include/serialdv -DLIBSERIALDV_LIBRARY=/opt/install/serialdv/lib/libserialdv.so ..
make -j $PROC install


#Codec2/FreeDV
sudo apt-get -y install libspeexdsp-dev libsamplerate0-dev
cd /opt/build
git clone https://github.com/drowe67/codec2.git
cd codec2
#git reset --hard 76a20416d715ee06f8b36a9953506876689a3bd2
mkdir build_linux; cd build_linux
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/opt/install/codec2 ..
make -j $PROC install


## Hardware ##

cd /opt/build
git clone https://github.com/f4exb/libmirisdr-4.git
cd libmirisdr-4
mkdir build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/opt/install/libmirisdr ..
make -j $PROC install

# rtl-sdr
cd /opt/build
git clone https://github.com/osmocom/rtl-sdr.git librtlsdr
cd librtlsdr
#git reset --hard be1d1206bfb6e6c41f7d91b20b77e20f929fa6a7
mkdir build; cd build
cmake -Wno-dev -DDETACH_KERNEL_DRIVER=ON -DCMAKE_INSTALL_PREFIX=/opt/install/librtlsdr ..
make -j $PROC install


cd /opt/build
git clone https://github.com/analogdevicesinc/libiio.git
cd libiio
#git reset --hard 826563e41b5ce9890b75506f672017de8d76d52d
mkdir build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/opt/install/libiio -DINSTALL_UDEV_RULE=OFF ..
make -j $PROC install


cd /opt/build
git clone https://github.com/Nuand/bladeRF.git
cd bladeRF/host
#git reset --hard "v2018.01.1"
mkdir build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/opt/install/libhackrf -DINSTALL_UDEV_RULES=OFF ..
make -j $PROC install


cd /opt/build
git clone https://github.com/myriadrf/LimeSuite.git
cd LimeSuite

cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/opt/install/LimeSuite ..
make -j $PROC install


cd /opt/build
git clone https://github.com/airspy/airspyhf
cd airspyhf
#git reset --hard "1.1.5"
mkdir build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/opt/install/libairspyhf ..
make -j $PROC install


cd /opt/build
git clone https://github.com/f4exb/libperseus-sdr.git
cd libperseus-sdr
git checkout fixes
#git reset --hard afefa23e3140ac79d845acb68cf0beeb86d09028
mkdir build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/opt/install/libperseus ..
make
make - j $PROC install


cd /opt/build
git clone https://github.com/xtrx-sdr/images.git xtrx-images
cd xtrx-images
#git reset --hard 053ec82
git submodule init
git submodule update
cd sources
mkdir build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/opt/install/xtrx-images -DENABLE_SOAPY=NO ..
make
make -j $PROC install


cd /opt/build
git clone https://github.com/pothosware/SoapySDR.git
cd SoapySDR
#it reset --hard "soapy-sdr-0.7.1"
mkdir build; cd build
cmake -DCMAKE_INSTALL_PREFIX=/opt/install/SoapySDR ..
make -j $PROC install


cd /opt/build
git clone https://github.com/pothosware/SoapyRTLSDR.git
cd SoapyRTLSDR
mkdir build; cd build
cmake -DCMAKE_INSTALL_PREFIX=/opt/install/SoapySDR  -DRTLSDR_INCLUDE_DIR=/opt/install/librtlsdr/include -DRTLSDR_LIBRARY=/opt/install/librtlsdr/lib/librtlsdr.so -DSOAPY_SDR_INCLUDE_DIR=/opt/install/SoapySDR/include -DSOAPY_SDR_LIBRARY=/opt/install/SoapySDR/lib/libSoapySDR.so ..
make -j $PROC install


cd /opt/build
git clone https://github.com/pothosware/SoapyHackRF.git
cd SoapyHackRF
mkdir build; cd build
cmake -DCMAKE_INSTALL_PREFIX=/opt/install/SoapySDR -DLIBHACKRF_INCLUDE_DIR=/opt/install/libhackrf/include/libhackrf -DLIBHACKRF_LIBRARY=/opt/install/libhackrf/lib/libhackrf.so -DSOAPY_SDR_INCLUDE_DIR=/opt/install/SoapySDR/include -DSOAPY_SDR_LIBRARY=/opt/install/SoapySDR/lib/libSoapySDR.so ..
make -j $PROC install


cd /opt/build
cd LimeSuite/builddir
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/opt/install/LimeSuite -DCMAKE_PREFIX_PATH=/opt/install/SoapySDR ..
make -j $PROC install
cp /opt/install/LimeSuite/lib/SoapySDR/modules0.7/libLMS7Support.so /opt/install/SoapySDR/lib/SoapySDR/modules0.7


sudo apt-get install libavahi-client-dev
cd /opt/build
git clone https://github.com/pothosware/SoapyRemote.git
cd SoapyRemote
#git reset --hard "soapy-remote-0.5.1"
mkdir build; cd build
cmake -DCMAKE_INSTALL_PREFIX=/opt/install/SoapySDR -DSOAPY_SDR_INCLUDE_DIR=/opt/install/SoapySDR/include -DSOAPY_SDR_LIBRARY=/opt/install/SoapySDR/lib/libSoapySDR.so ..
make -j $PROC install


mkdir -p /opt/install/libsdrplay/include
mkdir /opt/install/libsdrplay/lib
cd /usr/local/include
sudo mv mirsdrapi-rsp.h /opt/install/libsdrplay/include
cd ../lib
sudo mv libmirsdrapi-rsp.so.2.13 /opt/install/libsdrplay/lib
sudo rm libmirsdrapi-rsp.so*
sudo chown -R $USER:$USER /opt/install/libsdrplay/include
sudo chown -R $USER:$USER /opt/install/libsdrplay/lib
cd /opt/install/libsdrplay/lib
ln -s libmirsdrapi-rsp.so.2.13 libmirsdrapi-rsp.so.2
ln -s libmirsdrapi-rsp.so.2 libmirsdrapi-rsp.so


cd /opt/build
git clone https://github.com/pothosware/SoapySDRPlay.git
cd SoapySDRPlay
#git reset --hard "soapy-sdrplay-0.2.0"
mkdir build; cd build
cmake -DCMAKE_INSTALL_PREFIX=/opt/install/SoapySDR -DLIBSDRPLAY_INCLUDE_DIRS=/opt/install/libsdrplay/include -DLIBSDRPLAY_LIBRARIES=/opt/install/libsdrplay/lib/libmirsdrapi-rsp.so -DSOAPY_SDR_INCLUDE_DIR=/opt/install/SoapySDR/include -DSOAPY_SDR_LIBRARY=/opt/install/SoapySDR/lib/libSoapySDR.so ..
make -j $PROC install


d /opt/build
git clone https://github.com/f4exb/sdrangel.git
cd sdrangel
mkdir build; cd build
cmake -Wno-dev -DDEBUG_OUTPUT=ON -DRX_SAMPLE_24BIT=ON \
-DMIRISDR_DIR=/opt/install/libmirisdr \
-DAIRSPY_DIR=/opt/install/libairspy \
-DAIRSPYHF_DIR=/opt/install/libairspyhf \
-DBLADERF_DIR=/opt/install/libbladeRF \
-DHACKRF_DIR=/opt/install/libhackrf \
-DRTLSDR_DIR=/opt/install/librtlsdr \
-DLIMESUITE_DIR=/opt/install/LimeSuite \
-DIIO_DIR=/opt/install/libiio \
-DPERSEUS_DIR=/opt/install/libperseus \
-DXTRX_DIR=/opt/install/xtrx-images \
-DSOAPYSDR_DIR=/opt/install/SoapySDR \
-DCM256CC_DIR=/opt/install/cm256cc \
-DDSDCC_DIR=/opt/install/dsdcc \
-DSERIALDV_DIR=/opt/install/serialdv \
-DMBE_DIR=/opt/install/mbelib \
-DCODEC2_DIR=/opt/install/codec2 \
-DCMAKE_INSTALL_PREFIX=/opt/install/sdrangel ..
make -j $PROC install

sudo touch /usr/local/bin/sdrangel
sudo chmod 755 /usr/local/bin/sdrangel
echo '/opt/install/sdrangel/bin/sdrangel' | sudo tee /usr/local/bin/sdrangel