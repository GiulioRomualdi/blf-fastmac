# disable spotlight indexing
sudo mdutil -i off -a
echo Edit script-mac.sh in your fastmac repo to auto-run commands in your Mac instances

# remove conda
conda init --reverse
sudo rm -rf /usr/local/miniconda
rm -rf ~/.conda
rm -rf ~/.condarc

cd ~

# Download mambaforge
curl -fsSLo Mambaforge.sh https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-MacOSX-$(uname -m).sh
# Install with default options
bash ./Mambaforge.sh -b

~/mambaforge/condabin/conda init
~/mambaforge/condabin/conda config --set auto_activate_base false
source /Users/runner/.bash_profile 

conda create -n robotologyenv
conda activate robotologyenv

mamba install -c conda-forge cmake compilers make ninja pkg-config
mamba install -c conda-forge -c robotology idyntree yarp libmatio matio-cpp lie-group-controllers eigen qhull "casadi>=3.5.5" cppad spdlog catch2 nlohmann_json manif manifpy pybind11 numpy pytest scipy opencv pcl tomlplusplus unicycle-footstep-planner

cd ~
git clone https://github.com/ami-iit/bipedal-locomotion-framework.git
