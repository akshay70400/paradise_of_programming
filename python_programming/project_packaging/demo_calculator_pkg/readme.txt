$ pip install setuptools
$ pip install wheel

$ python setup.py bdist_wheel

# now your project wheel file would be created in 'dist' folder

# now you can install your package in our environment
$ pip install dist/my_pkg-0.0.1-py3-none-any.whl
