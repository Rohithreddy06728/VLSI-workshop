#!/usr/bin/env bash
set -euo pipefail
# Example interactive launch matching the report's Docker-based workflow.
# Mounts your home folder at /data; the exact image/tag and paths may need adjustment.
docker run --rm -it -v "$HOME":/data opensta
# Inside OpenSTA, source or enter commands from scripts/run_sta_corner.tcl after
# setting VSDBABYSOC_ROOT and SKY130_LIB in the container environment.
