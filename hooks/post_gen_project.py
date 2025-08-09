import sys
import subprocess

try:
    subprocess.call(['git', 'init'])
    subprocess.call(['git', 'add', '*'])
    subprocess.call(['git', 'commit', '-m', 'Initial commit'])
except Exception as e:
    print(e, file=sys.stderr)
