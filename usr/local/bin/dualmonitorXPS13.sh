#!/bin/bash
# A basic script to get working two monitors and touchscreen on hidpi xps13 2016 with Xorg. It scales the second monitor and restart plasma. The second monitor appears with a lof of blurry text but with scale to 1.6 and DPI to 158 I got a good compromise to work with two screens. see on MyConfigs/usr/local/bin/dualmonitorXPS13.sh
# Monitor settings
EDP1W=3200
EDP1H=1800
DP1W=$([ -n "$1" ] && echo $1 || echo 1920)
DP1H=$([ -n "$2" ] && echo $2 || echo 1080)
SCALE=$([ -n "$3" ] && echo $3 || echo 1.6)
FBX=$(awk "BEGIN {print ($DP1W*$SCALE)}")
FBY=$(awk "BEGIN {print ($DP1H*$SCALE)}")
EDP1X=0
DP1X=$FBX

# Touchscreen settings
TOUCHSCREEN_ID=$(xinput | grep "Touchscreen" | sed 's/.*id=\([0-9]*\).*/\1/')
TOTAL_WIDTH=$(awk "BEGIN {print ($FBX+$EDP1W)}")
TOTAL_HEIGHT=$(awk -v max=$EDP1 "BEGIN {if ($FBY > max) { max=$FBY } print max }")
TOUCH_WIDTH=$EDP1W
TOUCH_HEIGHT=$EDP1H
TOUCH_OFFSET_X=$FBX
TOUCH_OFFSET_Y=0
C0=$(awk "BEGIN {print ($TOUCH_WIDTH/$TOTAL_WIDTH)}")
C1=$(awk "BEGIN {print ($TOUCH_OFFSET_X/$TOTAL_WIDTH)}")
C2=$(awk "BEGIN {print ($TOUCH_HEIGHT/$TOTAL_HEIGHT)}")
C3=$(awk "BEGIN {print ($TOUCH_OFFSET_Y/$TOTAL_HEIGHT)}")

echo "Set dual monitor on XPS13 (2016) with KDE Plasma"
echo
echo "Usage: dualmonitor.sh [2nd monitor width = 1920] [2nd monitor height = 1200] [2nd monitor scale = 1.6]"
echo
echo "DP1 screen resolution: $DP1W * $DP1H"
echo "Scale factor = $SCALE"
echo "DP1 Meta resolution: $FBX * $FBY"
echo "Total resolution: $TOTAL_WIDTH * $TOTAL_HEIGHT"
echo 
echo "Touch screen settings"
echo "Touch area: $EDP1W * $EDP1H + $FBX + 0"
echo "Coordinate Transformation Matrix"
echo "-------------------"
echo -e "$C0\t0t\t$C1"
echo -e "0\t$C2\t$C3"
echo -e "0\t0\t1"
echo "-------------------"

xrandr --output DP1 --scale ${SCALE}x${SCALE} --fb ${FBX}x${FBY} --pos 0x0 --mode ${DP1W}x${DP1H}
xrandr --output eDP1 --scale 1x1 --pos ${FBX}x0
sleep 1
killall -9 plasmashell &
sleep 1
plasmashell &

xinput set-prop $TOUCHSCREEN_ID --type=float "Coordinate Transformation Matrix" $C0 0 $C1 0 $C2 $C3 0 0 1 
