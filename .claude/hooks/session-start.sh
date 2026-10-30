#!/bin/bash
# Installs the headless Chrome HyperFrames renders with, in Claude Code cloud sessions.
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

npx -y hyperframes@0.8.221 browser ensure
