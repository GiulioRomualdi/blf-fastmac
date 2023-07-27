

vcpkg_robotology_TAG=v0.10.1
YCM_TAG=v0.14.2
YARP_TAG=v3.7.0
iDynTree_TAG=v8.0.0
CasADi_TAG=3.5.5.2
manif_TAG=0.0.4
matioCpp_TAG=v0.2.0
LieGroupControllers_TAG=v0.2.0
osqp_TAG=v0.6.2
OsqpEigen_TAG=v0.7.0
tomlplusplus_TAG=v3.0.1
icub_models_TAG=v1.23.3
UnicyclePlanner_TAG=d3f6c80afe21a9958da769c8dd8a2bbfee5ea922
telemetry_TAG=v1.2.0

sudo apt-get update
sudo apt-get install git build-essential cmake libace-dev coinor-libipopt-dev \
                             libboost-system-dev libboost-filesystem-dev libboost-thread-dev \
                             liborocos-kdl-dev libeigen3-dev swig qtbase5-dev qtdeclarative5-dev \
                             qtmultimedia5-dev libxml2-dev liburdfdom-dev libtinyxml-dev \
                             liburdfdom-dev liboctave-dev python3-dev valgrind coinor-libipopt-dev \
                             libmatio-dev python3-pytest python3-numpy python3-scipy \
                             python3-setuptools  libspdlog-dev  libopencv-dev libpcl-dev \
                             python3-pybind11 nlohmann-json3-dev libassimp-dev libqhull-dev
# install realsense from apt (see https://github.com/IntelRealSense/librealsense/blob/master/doc/distribution_linux.md#installing-the-packages)
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCD
sudo add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo $(lsb_release -cs) main" -u
# please see https://github.com/IntelRealSense/realsense-ros/blob/a161efb84c9cf8077fbd37d6a78ef1fad0b677d0/.travis.yml#L17-L19
sudo apt-get update -qq
# please see https://github.com/IntelRealSense/librealsense/issues/9607#issuecomment-896789179
mkdir -p /usr/share/librealsense2/presets
sudo apt-get install librealsense2-dev

# YCM
cd ${GITHUB_WORKSPACE}
git clone -b ${YCM_TAG} https://github.com/robotology/ycm
cd ycm
mkdir -p build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${GITHUB_WORKSPACE}/install/deps ..
cmake --build . --config Release --target install

# YARP
cd ${GITHUB_WORKSPACE}
git clone https://github.com/robotology/yarp
cd yarp
git checkout ${YARP_TAG}
mkdir -p build
cd build
cmake  -DCMAKE_PREFIX_PATH=${GITHUB_WORKSPACE}/install/deps -DCMAKE_INSTALL_PREFIX=${GITHUB_WORKSPACE}/install/deps ..
cmake --build . --config Release --target install

# iDynTree
cd ${GITHUB_WORKSPACE}
git clone https://github.com/robotology/iDynTree
cd iDynTree
git checkout ${iDynTree_TAG}
mkdir -p build
cd build
cmake -DCMAKE_PREFIX_PATH=${GITHUB_WORKSPACE}/install/deps \
      -DCMAKE_BUILD_TYPE=Release \
      -DIDYNTREE_USES_PYTHON:BOOL=ON \
      -DIDYNTREE_USES_ASSIMP:BOOL=ON \
      -DCMAKE_INSTALL_PREFIX=${GITHUB_WORKSPACE}/install/deps ..
cmake --build . --config Release --target install

# osqp
cd ${GITHUB_WORKSPACE}
git clone --recursive -b ${osqp_TAG} https://github.com/oxfordcontrol/osqp
cd osqp
mkdir -p build
cd build
cmake -DCMAKE_PREFIX_PATH=${GITHUB_WORKSPACE}/install/deps -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=${GITHUB_WORKSPACE}/install/deps ..
cmake --build . --config Release --target install

# osqp-eigen
cd ${GITHUB_WORKSPACE}
git clone https://github.com/robotology/osqp-eigen
cd osqp-eigen
git checkout ${OsqpEigen_TAG}
mkdir -p build
cd build
cmake -DCMAKE_PREFIX_PATH=${GITHUB_WORKSPACE}/install/deps -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=${GITHUB_WORKSPACE}/install/deps ..
cmake --build . --config Release --target install

# CasADi
cd ${GITHUB_WORKSPACE}
git clone https://github.com/ami-iit/casadi.git -b ${CasADi_TAG} casadi
cd casadi
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${GITHUB_WORKSPACE}/install/deps -DWITH_IPOPT=BOOL:ON \
      -DWITH_OSQP:BOOL=ON -DUSE_SYSTEM_WISE_OSQP=BOOL:ON ..
cmake --build . --config Release --target install

# manif
cd ${GITHUB_WORKSPACE}
git clone https://github.com/artivis/manif.git
cd manif
git checkout ${manif_TAG}
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${GITHUB_WORKSPACE}/install/deps ..
cmake --build . --config Release --target install

# matioCpp
cd ${GITHUB_WORKSPACE}
git clone https://github.com/ami-iit/matio-cpp
cd matio-cpp
git checkout ${matioCpp_TAG}
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${GITHUB_WORKSPACE}/install/deps ..
cmake --build . --config Release --target install

# LieGroupControllers
cd ${GITHUB_WORKSPACE}
git clone https://github.com/ami-iit/lie-group-controllers
cd lie-group-controllers
git checkout ${LieGroupControllers_TAG}
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${GITHUB_WORKSPACE}/install/deps ..
cmake --build . --config Release --target install

# UnicycleFootstepPlanner
cd ${GITHUB_WORKSPACE}
git clone https://github.com/robotology/unicycle-footstep-planner
cd unicycle-footstep-planner
git checkout ${UnicyclePlanner_TAG}
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${GITHUB_WORKSPACE}/install/deps ..
cmake --build . --config Release --target install

# icub-models
cd ${GITHUB_WORKSPACE}
git clone https://github.com/robotology/icub-models
cd icub-models
git checkout ${icub_models_TAG}
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${GITHUB_WORKSPACE}/install/deps -DICUB_MODELS_USES_PYTHON:BOOL=ON ..
cmake --build . --config Release --target install

# robometry
cd ${GITHUB_WORKSPACE}
git clone https://github.com/robotology/robometry
cd robometry
git checkout ${telemetry_TAG}
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=${GITHUB_WORKSPACE}/install/deps ..
cmake --build . --config Release --target install


cd ${GITHUB_WORKSPACE}
git clone https://github.com/ami-iit/bipedal-locomotion-framework.git
cd bipedal-locomotion-framework
mkdir build && cd build
cmake -DCMAKE_PREFIX_PATH=${GITHUB_WORKSPACE}/install/deps \
              -DCMAKE_INSTALL_PREFIX=${GITHUB_WORKSPACE}/install \
              -DCMAKE_BUILD_TYPE=Release \
              -DFRAMEWORK_COMPILE_PYTHON_BINDINGS:BOOL=OFF \
              -DBUILD_TESTING:BOOL=ON ..
