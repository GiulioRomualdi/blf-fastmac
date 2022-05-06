# remove conda

sudo apt update
sudo apt install -y ucommon-utils


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
