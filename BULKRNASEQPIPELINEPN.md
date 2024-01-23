# BulkRNASeqPipelinePancreas
# This is a pipeline for the Bulk RNASEQ of pancreas samples
# Steps to analyse FASTQ and BAM files
# Download FTP using wget (link) into ubuntu
# OR Extract compressed .gz files using gunzip (name of file) in ubuntu

# Download Java and fastc in Ubuntu

# Step 1: Update the package lists
sudo apt-get update

# Step 2: Install OpenJDK 11 (adjust version as needed)
sudo apt install openjdk-11-jre-headless

# Step 3: Verify Java installation
java -version

# Optional: Set the JAVA_HOME environment variable
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
# Add the above line to your shell profile file (e.g., ~/.bashrc or ~/.zshrc) for persistence

# Optional: Add Java binaries to the system PATH
export PATH=$PATH:$JAVA_HOME/bin
# Add the above line to your shell profile file for persistence

# Install miniconda in Ubuntu
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
#once installing complete then paste
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh

# STEP 4: Begin QC sample using tool fastqc

# Step 5: Create a directory in /usr/local/ for FastQC
sudo mkdir -p /usr/local/fastqc

# Step 6: Navigate to the directory where FastQC will be saved
cd /usr/local/fastqc

# Step 7: Download and Install FastQC
sudo wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.12.1.zip

# Unzip the downloaded file
sudo unzip fastqc_v0.12.1.zip

# Step 4: Make the FastQC script executable
sudo chmod +x /usr/local/fastqc/FastQC/fastqc

# Step 5: Create a symbolic link to make FastQC executable system-wide
sudo ln -s /usr/local/fastqc/FastQC/fastqc /usr/local/bin/fastqc

# Next you need to install Hisat2 in Ubuntu 

wget https://cloud.biohpc.swmed.edu/index.php/s/oTtGWbWjaxsQ2Ho/download
unzip download
cd hisat2-2.2.1
#confirm hisat2-align-l and hisat2-align-s present and test its working by calling program
hisat2-2.2.1/hisat2
#export to PATH 
mkdir apps
mv -v hisat2-2.2.1/ apps/
#get directory location of hisat2 directory using 
cd apps/hisat2-2.2.1
pwd
#copy the working directory
cd
#Add hisat2 to PATH
nano .bashrc
#add to bottom, print the file path here and save changes 
export PATH=$PATH:/home/user/apps/hisat2-2.2.1

# or conda install -c bioconda hisat2 if you have Conda available
# place the program on PATH by adding this to the bottom of the shell configuration file
nano ~/.bashrc

export PATH="/path/to/hisat2:$PATH"
export PATH="/usr/local/fastqc/FastQC:$PATH"
source ~/.bashrc   # for Bash

# Step 6 install latest Trimmomatic release on USADELLAB github and requires java installed

wget "https://github.com/usadellab/Trimmomatic/files/5854859/Trimmomatic-0.39.zip"
unzip Trimmomatic-0.39.zip



