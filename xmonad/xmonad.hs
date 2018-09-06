import XMonad
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig (additionalKeys)


main = xmonad $ def 
  {
    layoutHook = spacingWithEdge 5 $ Tall 1 (3/100) (1/2) ||| Full  -- put gap around all windows
  } `additionalKeys` myAdditionalKeys

myAdditionalKeys =  
  [
    ((0 , 0x1008FF13), spawn "pactl set-sink-volume @DEFAULT_SINK@ +2%"),
    ((0 , 0x1008FF11), spawn "pactl set-sink-volume @DEFAULT_SINK@ -2%"),
    ((0 , 0x1008FF12), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
  ]

