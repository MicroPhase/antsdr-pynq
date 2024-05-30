from setuptools import setup, find_packages
from distutils.dir_util import copy_tree
import glob
import os
import subprocess
import sys
import shutil


# global variables
board = os.environ['BOARD']
board_folder = 'boards/{}/'.format(board)
notebooks_dir = os.environ['PYNQ_JUPYTER_NOTEBOOKS']
prio_data_files = []


# check whether board is supported
def check_env():
    if not os.path.isdir(board_folder):
        raise ValueError("Board {} is not supported.".format(board))
    if not os.path.isdir(notebooks_dir):
        raise ValueError("Directory {} does not exist.".format(notebooks_dir))


# excludes file from path and returns other files
def exclude_from_files(exclude, path):
    return [file for file in os.listdir(path)
            if os.path.isfile(os.path.join(path, file))
            and file != exclude]

def get_files(path):
    return [file for file in os.listdir(path)
            if os.path.isfile(os.path.join(path, file))]

# find dirs containing .bit files
def find_designs(path):
    result = []
    if os.path.isdir(path) and len(os.listdir(path)) > 0:
        for f in os.listdir(path):
            if os.path.isdir(os.path.join(path, f)) \
            and len(glob.glob(os.path.join(path, f, "*.bit"))) > 0:
                result += [f]
                print("f: " + f)

            tmp = find_designs(os.path.join(path, f))
            for p in tmp:
                result += [os.path.join(f, p)]
    return result

# collect and package the board's overlay designs
def collect_prio_designs():
    design_dirs = find_designs(board_folder)
    for ds in design_dirs:
        copy_tree(os.path.join(board_folder, ds), ds)
        files = exclude_from_files("makefile", ds)
        prio_data_files.extend([os.path.join("..", ds, f) for f in files])
    dtbo_src = os.path.join(board_folder, "prio_linux/dtbo")
    dtbo_dst = "prio_linux/dtbo"
    copy_tree(dtbo_src, dtbo_dst)
    files = get_files(dtbo_dst)
    prio_data_files.extend([os.path.join('..', dtbo_dst, f) for f in files])


# Copy notebooks in boards/BOARD/notebooks
def copy_notebooks():
    if os.path.isdir(board_folder):
        dst_folder = notebooks_dir
        if os.path.exists(os.path.join(dst_folder, 'prio')):
            shutil.rmtree(os.path.join(dst_folder, 'prio'))
        if os.path.exists(os.path.join(dst_folder, 'prio_linux')):
            shutil.rmtree(os.path.join(dst_folder, 'prio_linux'))
        copy_tree(os.path.join(board_folder, 'notebooks'), dst_folder)


check_env()
collect_prio_designs()
copy_notebooks()


setup(
    name="pynq_prio",
    version='1.0',
    install_requires=[
          'pynq>=2.5',
          'pyserial',
          'smbus2'
    ],
    url='https://github.com/byuccl/PYNQ-PRIO',
    license='BSD 3-Clause License',
    author="Hayden Cook, Tanner Gaskin",
    author_email="haydencook95@gmail.com, gaskin.tanner@byu.edu",
    packages=find_packages(),
    package_data={
        '': prio_data_files,
    },
    description="Partially Reconfigurable Input Output Project supporting PYNQ-enabled boards"
)
