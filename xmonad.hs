import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run(spawnPipe)
import XMonad.Actions.WorkspaceNames

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar"
  xmonad $ def
    { terminal    = myTerminal
    , modMask     = myModMask
    , borderWidth = myBorderWidth
    , logHook = workspaceNamesPP xmobarPP
        { ppOutput = hPutStrLn xmproc
        , ppTitle = id
        }
        >>= dynamicLogWithPP
    }

myTerminal    = "gnome-terminal"
myModMask     = mod4Mask -- Win key or Super_L
myBorderWidth = 1
