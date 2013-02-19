import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.NoBorders
import XMonad.Prompt
import XMonad.Layout.WorkspaceDir
import qualified Data.Map as M

-- The main function.
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { 
  ppCurrent = xmobarColor "#429942" "" . wrap "<" ">"
}

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myConfig = defaultConfig {
  terminal = "xterm",
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
    ((modm .|. shiftMask, xK_x     ), changeDir defaultXPConfig)
  ]
  
myWorkspaces = map show [1..9]
