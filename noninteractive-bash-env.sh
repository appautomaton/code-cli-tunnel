#!/usr/bin/env bash
set -euo pipefail

# This file is intended to be sourced by non-interactive bash via BASH_ENV.
# Example:
#   BASH_ENV=/path/to/noninteractive-bash-env.sh bash -c 'micromamba --version'

if [ -x "${HOME}/.local/bin/micromamba" ]; then
  # Make micromamba visible to non-interactive shells permanently via /usr/local/bin.
  if [ ! -e "/usr/local/bin/micromamba" ]; then
    ln -s "${HOME}/.local/bin/micromamba" /usr/local/bin/micromamba 2>/dev/null || true
  fi

  case ":${PATH}:" in
    *":${HOME}/.local/bin:"*) ;;
    *) export PATH="${HOME}/.local/bin:${PATH}" ;;
  esac
fi
