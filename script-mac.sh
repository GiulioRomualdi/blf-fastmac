# disable spotlight indexing
sudo mdutil -i off -a
echo Edit script-mac.sh in your fastmac repo to auto-run commands in your Mac instances

# Download
# Download
curl -fsSLo Miniforge3.sh https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-$(uname -m).sh
# Install with default options
bash ./Miniforge3.sh


~/miniforge3/condabin/conda init
conda config --set auto_activate_base false
conda create -n robotologyenv
conda activate robotologyenv

conda install cmake compilers make ninja pkg-config
conda install -c robotology idyntree yarp libmatio matio-cpp lie-group-controllers eigen qhull casadi cppad spdlog catch2

cd ~
git clone https://github.com/artivis/manif.git
cd manif
git checkout c8b4f16ea4d64e8d145aaf50bdbe31c756edb5b2
mkdir build
cd build
cmake -GNinja -DCMAKE_INSTALL_PREFIX=${CONDA_PREFIX} ..
cmake --build . --config Release --target install

cd ~
git clone https://github.com/dic-iit/bipedal-locomotion-framework.git
