.PHONY: build install clean test

SHELL = /bin/bash

default: bin/python3

bin/python3:
	virtualenv . -p python3 --no-site-packages
	bin/pip3 install --upgrade pip
	bin/pip3 install wheel
	bin/pip3 install -r requirements.txt

install: build
	bin/python3 setup.py install

build: bin/python3
	bin/python3 setup.py build

clean:
	# virtualenv
	rm -Rf bin include lib local
	# buildout and pip
	rm -Rf develop-eggs eggs *.egg-info
	rm -Rf src parts build dist
	rm -Rf .installed.cfg pip-selfcheck.json

test:
	bin/py.test -m 'not ignore' --pep8 tests

