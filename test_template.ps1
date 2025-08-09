# Simple script to test the template locally
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$PROJ_DIR = 'python-hatch-project'

Set-Location ..
if (Test-Path $PROJ_DIR) {
    Remove-Item -Recurse -Force $PROJ_DIR
}

cookiecutter --no-input Hatchelorette

Set-Location $PROJ_DIR

hatch env prune

hatch build
hatch clean
hatch version

hatch run fibonacci 10
hatch run test:cov
hatch run lint:all

hatch run pre-commit run --all-files
