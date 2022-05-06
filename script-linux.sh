# remove conda

sudo apt update
sudo apt install -y ucommon-utils


conda init --reverse
sudo rm -rf /usr/local/miniconda
rm -rf ~/.conda
rm -rf ~/.condarc

cd ~
# Download mambaforge
curl -fsSLo Mambaforge.sh https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-$(uname -m).sh
# Install with default options
bash ./Mambaforge.sh -b

~/mambaforge/condabin/conda init
source /home/runner/.bashrc
