# disable spotlight indexing
sudo mdutil -i off -a
echo Edit script-mac.sh in your fastmac repo to auto-run commands in your Mac instances

# remove conda
conda init --reverse
sudo rm -rf /usr/local/miniconda
rm -rf ~/.conda
rm -rf ~/.condarc

cd ~

# Download miniforge3
curl -fsSLo Miniforge3.sh https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-$(uname -m).sh
# Install with default options
bash ./Miniforge3.sh -b

~/miniforge3/condabin/conda init
~/miniforge3/condabin/conda config --set auto_activate_base false
source /Users/runner/.bash_profile 

conda create -n robotologyenv
conda activate robotologyenv

conda install cmake compilers make ninja pkg-config
conda install -c conda-forge - c robotology idyntree yarp libmatio matio-cpp lie-group-controllers eigen qhull "casadi>=3.5.5" cppad spdlog catch2 nlohmann_json manif manifpy pybind11 numpy pytest scipy opencv pcl tomlplusplus unicycle-footstep-planner

cd ~
git clone https://github.com/dic-iit/bipedal-locomotion-framework.git
