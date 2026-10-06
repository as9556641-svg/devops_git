#!/usr/bin/env bash

set -euo pipefail

if ! command -v uname >/dev/null 2>&1; then
  printf 'Error: uname is required to identify the operating system.\n' >&2
  exit 1
fi

printf 'Project environment check\n'
printf '%s\n' '-------------------------'
printf 'Operating system: %s\n' "$(uname -s)"

python_cmd=
if command -v python3 >/dev/null 2>&1 && python3 -c 'import sys' >/dev/null 2>&1; then
  python_cmd=python3
elif command -v python >/dev/null 2>&1 && python -c 'import sys' >/dev/null 2>&1; then
  python_cmd=python
fi

if [[ -n "$python_cmd" ]]; then
  python_version=$("$python_cmd" -c 'import sys; print(sys.version.split()[0])')
  printf 'Python: %s\n' "$python_version"
else
  printf 'Python: not found (optional)\n'
fi
