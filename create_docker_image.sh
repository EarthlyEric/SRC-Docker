#!/bin/bash
clear
git clone https://github.com/ayasa520/redroid-script.git
cd redroid-script
uv init
uv pip install -r requirements.txt
uv run python redroid.py -a 11.0.0 -lg -n