#!/usr/bin/bash
set -euo pipefail

west build -p -d build/left -b nice_nano_v2 -- \
    -DSHIELD="Sofle_L nice_oled" \
    -DZMK_CONFIG=/workspaces/zmk-config/config \
    -DZMK_EXTRA_MODULES=/workspaces/zmk-config/

west build -p -d build/right -b nice_nano_v2 -- \
    -DSHIELD="Sofle_R nice_oled" \
    -DZMK_CONFIG=/workspaces/zmk-config/config \
    -DZMK_EXTRA_MODULES=/workspaces/zmk-config/

cp build/left/zephyr/zmk.uf2 /workspaces/bin/left.uf2
cp build/right/zephyr/zmk.uf2 /workspaces/bin/right.uf2
