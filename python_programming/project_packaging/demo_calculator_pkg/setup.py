import setuptools

setuptools.setup(
    name="my_pkg",
    version="0.0.1",
    author="user-name",
    author_email="user_name@asd.com",
    description="Package to print anything",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.7',
)
