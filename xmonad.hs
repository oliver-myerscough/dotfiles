import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.Loggers
import XMonad.Layout.NoBorders
import XMonad.Prompt
import XMonad.Prompt.Ssh
import XMonad.Layout.WorkspaceDir
import XMonad.Config.Gnome
import Text.Printf
import qualified Data.Map as M

-- The main function.
main = xmonad 
        =<< bottomBar 
        =<< topBar myConfig

topBar = statusBar "xmobar" topPP hideBarKey 
bottomBar = statusBar "xmobar -b .xmobar-bottomrc" bottomPP hideBarKey 

-- Custom PP, configure it as you like. It determines what is being written to the bar.
topPP = xmobarPP
bottomPP = nullPP 
  
-- to extend logging
loggerPP = nullPP {
  ppExtras = [ battery ]
}

-- pretty printer which cuts input
nullPP = xmobarPP {
  ppCurrent = const "",
  ppVisible = const "",
  ppHidden = const "",
  ppTitle = const "",
  ppLayout = const ""
}

-- Key binding to toggle the gap for the bar.
hideBarKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myConfig = defaultConfig {
  terminal = "sakura",
  workspaces = myWorkspaces,
  layoutHook = myLayoutHook, 
  logHook = myLogHook,
  keys = \ x -> myKeys x `M.union` keys defaultConfig x
}

myLogHook
  = dynamicLogWithPP $ xmobarPP {
      ppOrder = \(ws:l:t:e) -> [ws, l] ++ e
  } 

myLayoutHook
  = smartBorders $ 
      workspaceDir "~" $ 
      layoutHook defaultConfig

myKeys (XConfig {XMonad.modMask = modm}) 
  = M.fromList [ 
    ((modm .|. shiftMask, xK_x     ), changeDir defaultXPConfig),
    ((modm .|. shiftMask, xK_s     ), sshPrompt defaultXPConfig)
  ]
  
myWorkspaces = map show [1..9]
