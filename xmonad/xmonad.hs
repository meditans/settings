import XMonad
import XMonad.Util.EZConfig

main = xmonad $ defaultConfig
  { modMask = mod4Mask   -- super instead of alt
  , terminal = "terminator"
  , borderWidth = 0
  }
  `additionalKeysP`
  [ ("M-e", spawn "emacsclient -c")
  , ("M-f", spawn "firefox")
  , ("M-c", spawn "conkeror")
  ]
