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

# Next you need to install Hisat2

sudo apt install hisat2
# or conda install -c bioconda hisat2 if you have Conda avialable
# place the program on path by adding this to the bottom of the shell configuration file
nano ~/.bashrc

export PATH="/path/to/hisat2:$PATH"
export PATH="/usr/local/fastqc/FastQC:$PATH"
source ~/.bashrc   # for Bash

# Step 6 install latest Trimmomatic release on USADELLAB github and requires java installed

wget "https://github.com/usadellab/Trimmomatic/files/5854859/Trimmomatic-0.39.zip"
unzip Trimmomatic-0.39.zip



