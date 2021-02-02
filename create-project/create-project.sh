#!/bin/bash -e

#Python interpreter path (conda)
#pyInterPATH=
topDIR=
projNAME=
pkgNAME=
subpkgNAME=

mkdir -p ${topDIR}/${projNAME}
cd ${topDIR}/${projNAME}
touch README.md
touch requirements.txt
touch LICENSE
touch setup.py

# create directories: 
# src                     main source directory
# src/pkgNAME             top level package 
# src/pkgNAME/subpkgNAME  subpackage
mkdir bin src tests docs
mkdir src/${pkgNAME}
mkdir src/${subpkgNAME}

# add initialization files
touch src/${pkgNAME}/__init__.py
touch src/${pkgNAME}/${subpkgNAME}/__init__.py
touch tests/__init__.py
# add python files
touch src/${pkgNAME}/${subpkgNAME}/${subpkgNAME}.py
touch tests/test_${subpkgNAME}.py


# activate virtual environment
python3 -m venv ${projNAME}-env
source ${projNAME}-env/bin/activate

# dependencies : 
# here we grab dependencies using pipreqs
#pip install pipreqs
#pipreqs . --force  
pip install -r requirements.txt


