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
mkdir bin src tests docs data
mkdir src/${pkgNAME}
mkdir src/${pkgNAME}/${subpkgNAME}

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


# generate a setup.py file
echo -e "
from setuptools import setup
from setuptools import find_packages

with open("README.md", "r") as fh:
    long_description = fh.read()
with open("requirements.txt", "r") as fh:
    requirements = [line.strip() for line in fh]

setup(
    name='proj',
    version='1.0.0',
    license='MIT',
    author='M. H. Bani-Hashemian',
    author_email='hossein.banihashemian@alumni.ethz.ch',
    description='A script to create a python project from scratch',
    long_description=long_description,
    long_description_content_type='text/markdown',
    url='https://github.com/seyedb/misc-projects',
    package_dir={'': 'src'},
    packages=find_packages('src'),
    test_suite='tests',
    classifiers=[
        'Development Status :: 1 - Alpha',
        'Intended Audience :: Developers',
        'Topic :: Software Development :: Build Tools',
        'Programming Language :: Python :: 3',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
    ],
    keywords=[],
    python_requires='>=3.6',
    install_requires=requirements
)
" > setup.py