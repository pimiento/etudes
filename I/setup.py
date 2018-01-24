#!/usr/bin/env python3
from distutils.core import setup
from Cython.Build import cythonize

setup(ext_modules=cythonize([
    'configurations.pyx', 'controller.pyx', 'model.pyx',
    'exceptions.pyx', 'view.pyx', 'utils.pyx'
]))
