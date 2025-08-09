#!/bin/sh
# Simple script to test the template locally
set -x -e

PROJ_DIR='python-hatch-project'

cd ..
if [ -d "$PROJ_DIR" ]; then
	rm -rf "$PROJ_DIR"
fi

cookiecutter --no-input the-hatchelorette

cd $PROJ_DIR

hatch env prune

hatch build
hatch clean
hatch version

hatch run fibonacci 10
hatch run test:cov
hatch run lint:all

hatch run pre-commit run --all-files
