#!/bin/bash
#Install python modules for DIS.
set -u

pip3 install setuptools==56.2.0
pip3 install numpy==1.21.5
pip3 install matplotlib==3.4.3
pip3 install pandas==1.3.5
pip3 install pyarrow==3.0.0
pip3 install sql-metadata==2.3.0
pip3 install Flask==2.2.2
pip3 install requests==2.26.0
