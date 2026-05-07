#!/usr/bin/env bash
set -euo pipefail

echo "== DNS sanity check =="
cat /etc/resolv.conf
if ! getent hosts ports.ubuntu.com >/dev/null; then
    echo "ERROR: cannot resolve ports.ubuntu.com — DNS is broken inside the container."
    echo "Fix OrbStack DNS before continuing. Aborting fast instead of waiting on apt timeouts."
    exit 1
fi
echo "DNS OK"

echo "== Apt: pandoc, R, Python, Node, build deps =="
sudo apt-get update
sudo apt-get install -y --no-install-recommends \
    pandoc \
    r-base r-base-dev \
    python3 python3-pip python3-venv \
    nodejs npm \
    libxml2-dev libcurl4-openssl-dev libssl-dev \
    libfontconfig1-dev libharfbuzz-dev libfribidi-dev \
    libfreetype6-dev libpng-dev libtiff-dev libjpeg-dev \
    libcairo2-dev
sudo rm -rf /var/lib/apt/lists/*

echo "== R packages (CRAN) =="
sudo Rscript -e 'install.packages(c("remotes","ggplot2","ggpubr","data.table","dplyr","scales","openxlsx"), repos="https://cloud.r-project.org", Ncpus=parallel::detectCores())'

echo "== R package (GitHub: dampack) =="
sudo Rscript -e 'remotes::install_github("DARTH-git/dampack", upgrade="never")'

echo "== Python packages =="
sudo pip3 install --break-system-packages --no-cache-dir \
    numpy scipy pandas openpyxl \
    python-docx python-pptx pypandoc

echo "== Claude Code CLI =="
sudo npm install -g @anthropic-ai/claude-code

echo "== Done =="
