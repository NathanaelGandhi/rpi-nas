## https://github.com/NathanaelGandhi
## Last Modified: 14 September 2021
## Tested on: Raspberry Pi 4b - Raspberry Pi OS Lite (May 7th 2021)

#!/bin/bash

while true; do
        /opt/vc/bin/vcgencmd measure_temp
        sleep 1
done
