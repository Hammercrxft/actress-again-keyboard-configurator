#NoEnv
SendMode Input
#SingleInstance Force
SetBatchLines -1
ListLines Off
;#IfWinActive ahk_exe MBAA.exe
;Menu, Tray, Icon, mbaacc.ico
;#Warn remove me

;=========================
;     DEFAULT CONTROLS
;=========================

;---Global Settings---
reconfig_enabled = 1
global_escape = esc
escape_is_delayed = 1
remember_config = 1

creamed=0


;----PLAYER 1 CONTROLS----

initialize:
  player1_up = w
  
  player1_down = s
  
  player1_left = a
  
  player1_right = d
  
  ;(Weak attack, confirmation button.)
  player1_a = c
  
  ;(Medium attack, cancellation button.)
  player1_b = v
  
  ;(Heavy attack.)
  player1_c = b
  
  ;(Technical shield, its use varies in Moon-style fighters.)
  player1_d = f
  
  ;(Outputs different button combinations depending on the direction held.)
  ;(Often used to activate HEAT or CIRCUIT SPARK while not moving.)
  ;(And used to throw opponents when moving/leaning horizontally.)
  player1_e = e
  
  ;(Also pauses the game while on a fight.)
  player1_start = q
  
  ;----PLAYER 2 CONTROLS----
  
  player2_up = i
  
  player2_down = j
  
  player2_left = k
  
  player2_right = l
  
  ;(Weak attack, confirmation button.)
  player2_a = left
  
  ;(Medium attack, cancellation button.)
  player2_b = down
  
  ;(Heavy attack.)
  player2_c = right
  
  ;(Technical shield, its use varies in Moon-style fighters.)
  player2_d = up
  
  ;(Outputs different button combinations depending on the direction held.)
  ;(Often used to activate HEAT or CIRCUIT SPARK while not moving.)
  ;(And used to throw opponents when moving/leaning horizontally.)
  player2_e = o
  
  ;(Also pauses the game while on a fight.)
  player2_start = u
  
  ;---Rememberconfig----
  try ;get remember from key
  {
    RegRead, remember_config, HKEY_CURRENT_USER\Software\AAKConfigurator , REMEMBER
  }
  catch
  {
    ;do no shit.
  }
  
  if (remember_config=1)
  {
    try
    {
      RegRead, player1_up, HKEY_CURRENT_USER\Software\AAKConfigurator , PLAYER1_UP
      RegRead, player1_left, HKEY_CURRENT_USER\Software\AAKConfigurator , PLAYER1_LEFT
      RegRead, player1_down, HKEY_CURRENT_USER\Software\AAKConfigurator , PLAYER1_DOWN
      RegRead, player1_right, HKEY_CURRENT_USER\Software\AAKConfigurator , PLAYER1_RIGHT
      RegRead, player1_a, HKEY_CURRENT_USER\Software\AAKConfigurator , PLAYER1_A
      RegRead, player1_b, HKEY_CURRENT_USER\Software\AAKConfigurator , PLAYER1_B
      RegRead, player1_c, HKEY_CURRENT_USER\Software\AAKConfigurator , PLAYER1_C
      RegRead, player1_d, HKEY_CURRENT_USER\Software\AAKConfigurator , PLAYER1_D
      RegRead, player1_e, HKEY_CURRENT_USER\Software\AAKConfigurator , PLAYER1_E
      RegRead, player1_start, HKEY_CURRENT_USER\Software\AAKConfigurator , PLAYER1_START
      
      RegRead, player2_up, HKEY_CURRENT_USER\Software\AAKConfigurator , PLAYER2_UP
      RegRead, player2_left, HKEY_CURRENT_USER\Software\AAKConfigurator , PLAYER2_LEFT
      RegRead, player2_down, HKEY_CURRENT_USER\Software\AAKConfigurator , PLAYER2_DOWN
      RegRead, player2_right, HKEY_CURRENT_USER\Software\AAKConfigurator , PLAYER2_RIGHT
      RegRead, player2_a, HKEY_CURRENT_USER\Software\AAKConfigurator , PLAYER2_A
      RegRead, player2_b, HKEY_CURRENT_USER\Software\AAKConfigurator , PLAYER2_B
      RegRead, player2_c, HKEY_CURRENT_USER\Software\AAKConfigurator , PLAYER2_C
      RegRead, player2_d, HKEY_CURRENT_USER\Software\AAKConfigurator , PLAYER2_D
      RegRead, player2_e, HKEY_CURRENT_USER\Software\AAKConfigurator , PLAYER2_E
      RegRead, player2_start, HKEY_CURRENT_USER\Software\AAKConfigurator , PLAYER2_START
      
      RegRead, global_escape, HKEY_CURRENT_USER\Software\AAKConfigurator , GLOBAL_ESCAPE
      RegRead, escape_is_delayed, HKEY_CURRENT_USER\Software\AAKConfigurator , ESCAPE_IS_DELAYED
      RegRead, reconfig_enabled, HKEY_CURRENT_USER\Software\AAKConfigurator , RECONFIG_ENABLED
    }
  }
  
  ;---GUI Setup---
guisetup:
  Gui, Destroy
  Gui, New, -minimizebox -theme, Actress Again Keyboard Configurator ;create a window
  Gui, Add, Text, x252 y29 w90 h20 , Move Up
  Gui, Add, Text, x252 y59 w90 h20 , Move Left
  Gui, Add, Text, x252 y89 w90 h20 , Move Down
  Gui, Add, Text, x252 y119 w90 h20 , Move Right
  Gui, Add, Text, x252 y149 w90 h20 , Light Attk/Confirm
  Gui, Add, Text, x252 y179 w90 h20 , Med. Attk/Cancel
  Gui, Add, Text, x252 y209 w90 h20 , Heavy Attack
  Gui, Add, Text, x252 y239 w90 h20 , Advanced Guard
  Gui, Add, Text, x252 y269 w90 h20 , QA (Heat/Throw)
  Gui, Add, Text, x252 y299 w90 h20 , Start/Pause
  Gui, Add, GroupBox, x12 y9 w220 h320 , Player 1 (Left)
  Gui, Add, Edit, x32 y29 w180 h20 vplayer1_up, %player1_up%
  Gui, Add, Edit, x32 y59 w180 h20 vplayer1_left, %player1_left%
  Gui, Add, Edit, x32 y89 w180 h20 vplayer1_down, %player1_down%
  Gui, Add, Edit, x32 y119 w180 h20 vplayer1_right, %player1_right%
  Gui, Add, Edit, x32 y149 w180 h20 vplayer1_a, %player1_a%
  Gui, Add, Edit, x32 y179 w180 h20 vplayer1_b, %player1_b%
  Gui, Add, Edit, x32 y209 w180 h20 vplayer1_c, %player1_c%
  Gui, Add, Edit, x32 y239 w180 h20 vplayer1_d, %player1_d%
  Gui, Add, Edit, x32 y269 w180 h20 vplayer1_e, %player1_e%
  Gui, Add, Edit, x32 y299 w180 h20 vplayet1_start, %player1_start%
  Gui, Add, GroupBox, x362 y9 w220 h320 , Player 2 (Right)
  Gui, Add, Edit, x382 y29 w180 h20 vplayer2_up, %player2_up%
  Gui, Add, Edit, x382 y59 w180 h20 vplayer2_left, %player2_left%
  Gui, Add, Edit, x382 y89 w180 h20 vplayer2_down, %player2_down%
  Gui, Add, Edit, x382 y119 w180 h20 vplayer2_right, %player2_right%
  Gui, Add, Edit, x382 y149 w180 h20 vplayer2_a, %player2_a%
  Gui, Add, Edit, x382 y179 w180 h20 vplayer2_b, %player2_b%
  Gui, Add, Edit, x382 y209 w180 h20 vplayer2_c, %player2_c%
  Gui, Add, Edit, x382 y239 w180 h20 vplayer2_d, %player2_d%
  Gui, Add, Edit, x382 y269 w180 h20 vplayer2_e, %player2_e%
  Gui, Add, Edit, x382 y299 w180 h20 vplayer2_start, %player2_start%
  Gui, Add, GroupBox, x12 y321 w570 h120 , Other Stuff
  Gui, Add, Text, x48 y350 w120 h20 , Exit and Quit Game (Key)
  Gui, Add, Edit, x48 y370 w120 h20 vglobal_escape, %global_escape%
  Gui, Add, CheckBox, x48 y400 w120 h20 Checked%escape_is_delayed% vescape_is_delayed, Hold to Exit
  Gui, Add, CheckBox, x244 y350 w120 h30 Checked%reconfig_enabled% vreconfig_enabled, F10 Reload
  Gui, Add, CheckBox, x244 y385 w120 h30 Checked%remember_config% vremember_config, Remember Current Settings
  Gui, Add, Picture, x480 y335 w100 h100, art.bmp
  try
  {
    RegRead, creamed, HKEY_CURRENT_USER\Software\AAKConfigurator , CREAMED
    if(creamed=1){
      Gui, Add, Text, x160 y450 w360 h20 , Incorrect key name(s). See list of key names in README.
      RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, CREAMED, 0
      creamed = 0
    }
  }
  catch
  {
    ;dont care
  }
  Gui, Add, Button, x492 y450 w90 h20 gconfigsubmit, Apply and Close
  Gui, Add, Button, x12 y450 w60 h20 gimport, Import...
  Gui, Add, Button, x80 y450 w60 h20 gexport, Export...
  ;Generated using SmartGUI Creator 4.0
  Gui, Show, x0 y0 h480 w600
Return

configsubmit:
  Gui, Submit
  
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, PLAYER1_UP, %player1_up%
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, PLAYER1_LEFT, %player1_left%
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, PLAYER1_DOWN, %player1_down%
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, PLAYER1_RIGHT, %player1_right%
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, PLAYER1_A, %player1_a%
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, PLAYER1_B, %player1_b%
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, PLAYER1_C, %player1_c%
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, PLAYER1_D, %player1_d%
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, PLAYER1_E, %player1_e%
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, PLAYER1_START, %player1_start%
  
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, PLAYER2_UP, %player2_up%
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, PLAYER2_LEFT, %player2_left%
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, PLAYER2_DOWN, %player2_down%
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, PLAYER2_RIGHT, %player2_right%
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, PLAYER2_A, %player2_a%
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, PLAYER2_B, %player2_b%
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, PLAYER2_C, %player2_c%
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, PLAYER2_D, %player2_d%
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, PLAYER2_E, %player2_e%
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, PLAYER2_START, %player2_start%
  
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, GLOBAL_ESCAPE, %global_escape%
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, ESCAPE_IS_DELAYED, %escape_is_delayed%
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, RECONFIG_ENABLED, %reconfig_enabled%
  RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, REMEMBER, %remember_config%
  
  ;---Hotkeys---
  #IfWinActive ahk_exe MBAA.exe
  Hotkey, *w, do_nothing
  Hotkey, *a, do_nothing
  Hotkey, *s, do_nothing
  Hotkey, *d, do_nothing
  
  Hotkey, *c, do_nothing
  Hotkey, *v, do_nothing
  Hotkey, *b, do_nothing
  Hotkey, *f, do_nothing
  Hotkey, *e, do_nothing
  Hotkey, *q, do_nothing
  
  Hotkey, *i, do_nothing
  Hotkey, *j, do_nothing
  Hotkey, *k, do_nothing
  Hotkey, *l, do_nothing
  
  Hotkey, *left, do_nothing
  Hotkey, *down, do_nothing
  Hotkey, *right, do_nothing
  Hotkey, *up, do_nothing
  Hotkey, *o, do_nothing
  Hotkey, *u, do_nothing
  
  Hotkey, *esc, do_nothing
  
  try
  {
    Hotkey, *%player1_a%, p1a
    Hotkey, *%player1_a% Up, p1aup
    
    Hotkey, *%player1_b%, p1b
    Hotkey, *%player1_b% Up, p1bup
    
    Hotkey, *%player1_c%, p1c
    Hotkey, *%player1_c% Up, p1cup
    
    Hotkey, *%player1_d%, p1d
    Hotkey, *%player1_d% Up, p1dup
    
    Hotkey, *%player1_e%, p1e
    Hotkey, *%player1_e% Up, p1eup
    
    Hotkey, *%player1_start%, p1start
    Hotkey, *%player1_start% Up, p1startup
    
    Hotkey, *%player1_up%, p1up
    Hotkey, *%player1_up% Up, p1upup
    
    Hotkey, *%player1_down%, p1down
    Hotkey, *%player1_down% Up, p1downup
    
    Hotkey, *%player1_left%, p1left
    Hotkey, *%player1_left% Up, p1leftup
    
    Hotkey, *%player1_right%, p1right
    Hotkey, *%player1_right% Up, p1rightup
    
    
    Hotkey, *%player2_a%, p2a
    Hotkey, *%player2_a% Up, p2aup
    
    Hotkey, *%player2_b%, p2b
    Hotkey, *%player2_b% Up, p2bup
    
    Hotkey, *%player2_c%, p2c
    Hotkey, *%player2_c% Up, p2cup
    
    Hotkey, *%player2_d%, p2d
    Hotkey, *%player2_d% Up, p2dup
    
    Hotkey, *%player2_e%, p2e
    Hotkey, *%player2_e% Up, p2eup
    
    Hotkey, *%player2_start%, p2start
    Hotkey, *%player2_start% Up, p2startup
    
    Hotkey, *%player2_up%, p2up
    Hotkey, *%player2_up% Up, p2upup
    
    Hotkey, *%player2_down%, p2down
    Hotkey, *%player2_down% Up, p2downup
    
    Hotkey, *%player2_left%, p2left
    Hotkey, *%player2_left% Up, p2leftup
    
    Hotkey, *%player2_right%, p2right
    Hotkey, *%player2_right% Up, p2rightup
    
    if (escape_is_delayed = 1)
      Hotkey, *%global_escape%, delayedexit
    else
      Hotkey, *%global_escape%, gescape
    
    Hotkey, *F10, reloadscript
  }
  catch
  {
    RegWrite REG_SZ, HKEY_CURRENT_USER\Software\AAKConfigurator, CREAMED, 1
    goto reloadscript
  }
Return

;---Action Labels---
do_nothing:
  
Return

p1a:
  Send {Blind}{c downR}
Return

p1aup:
  Send {Blind}{c up}
Return

p1b:
  Send {Blind}{v downR}
Return

p1bup:
  Send {Blind}{v up}
Return

p1c:
  Send {Blind}{b downR}
Return

p1cup:
  Send {Blind}{b up}
Return

p1d:
  Send {Blind}{f downR}
Return

p1dup:
  Send {Blind}{f up}
Return

p1e:
  Send {Blind}{e downR}
Return

p1eup:
  Send {Blind}{e up}
Return

p1start:
  Send {Blind}{q downR}
Return

p1startup:
  Send {Blind}{q up}
Return

p1up:
  Send {Blind}{w downR}
Return

p1upup:
  Send {Blind}{w up}
Return

p1down:
  Send {Blind}{s downR}
Return

p1downup:
  Send {Blind}{s up}
Return

p1left:
  Send {Blind}{a downR}
Return

p1leftup:
  Send {Blind}{a up}
Return

p1right:
  Send {Blind}{d downR}
Return

p1rightup:
  Send {Blind}{d up}
Return


p2a:
  Send {Blind}{left downR}
Return

p2aup:
  Send {Blind}{left up}
Return

p2b:
  Send {Blind}{down downR}
Return

p2bup:
  Send {Blind}{down up}
Return

p2c:
  Send {Blind}{right downR}
Return

p2cup:
  Send {Blind}{right up}
Return

p2d:
  Send {Blind}{up downR}
Return

p2dup:
  Send {Blind}{up up}
Return

p2e:
  Send {Blind}{o downR}
Return

p2eup:
  Send {Blind}{o up}
Return

p2start:
  Send {Blind}{u downR}
Return

p2startup:
  Send {Blind}{u up}
Return

p2up:
  Send {Blind}{i downR}
Return

p2upup:
  Send {Blind}{i up}
Return

p2down:
  Send {Blind}{k downR}
Return

p2downup:
  Send {Blind}{k up}
Return

p2left:
  Send {Blind}{j downR}
Return

p2leftup:
  Send {Blind}{j up}
Return

p2right:
  Send {Blind}{l downR}
Return

p2rightup:
  Send {Blind}{l up}
Return

delayedexit:
  c=0
  Gui, Destroy
  Gui, -caption +ToolWindow +AlwaysOnTop +HwndQuit +E0x20
  Gui, add, picture, x0 y0 w212 h28 hwndPic, quitting.bmp
  Gui, Show, NoActivate w212 h28, Quitting
  SendMessage, 0x0014,,,,Quitting
  Loop 
  {
    c++
    if(!GetKeyState("Esc","P"))
    {
      Break
    }
    if(c = 3)
    {
      Send {Blind}{Escape downT}
      Send {Blind}{Escape up}
      ExitApp
      Break
    }
    Sleep, 333
  }
  Gui, Destroy
Return

reloadscript:
  Reload
Return

import:
targetfile =: ""
FileSelectFile, targetfile , 3, %A_ScriptDir%, Import Configuration..., Configuration Files (*.ini)
IniRead, player1_up, %targetfile%, AAKC, player1_up
IniRead, player1_left, %targetfile%, AAKC, player1_left
IniRead, player1_down, %targetfile%, AAKC, player1_down
IniRead, player1_right, %targetfile%, AAKC, player1_right
IniRead, player1_a, %targetfile%, AAKC, player1_a
IniRead, player1_b, %targetfile%, AAKC, player1_b
IniRead, player1_c, %targetfile%, AAKC, player1_c
IniRead, player1_d, %targetfile%, AAKC, player1_d
IniRead, player1_e, %targetfile%, AAKC, player1_e
IniRead, player1_start, %targetfile%, AAKC, player1_start
IniRead, player2_up, %targetfile%, AAKC, player2_up
IniRead, player2_left, %targetfile%, AAKC, player2_left
IniRead, player2_down, %targetfile%, AAKC, player2_down
IniRead, player2_right, %targetfile%, AAKC, player2_right
IniRead, player2_a, %targetfile%, AAKC, player2_a
IniRead, player2_b, %targetfile%, AAKC, player2_b
IniRead, player2_c, %targetfile%, AAKC, player2_c
IniRead, player2_d, %targetfile%, AAKC, player2_d
IniRead, player2_e, %targetfile%, AAKC, player2_e
IniRead, player2_start, %targetfile%, AAKC, player2_start
goto guisetup

export:
Gui, Submit, NoHide
targetcontent =
(
player1_up = %player1_up%
player1_left = %player1_left%
player1_down = %player1_down%
player1_right = %player1_right%
player1_a = %player1_a%
player1_b = %player1_b%
player1_c = %player1_c%
player1_d = %player1_d%
player1_e = %player1_e%
player1_start = %player1_start%
player2_up = %player2_up%
player2_left = %player2_left%
player2_down = %player2_down%
player2_right = %player2_right%
player2_a = %player2_a%
player2_b = %player2_b%
player2_c = %player2_c%
player2_d = %player2_d%
player2_e = %player2_e%
player2_start = %player2_start%
)
targetfile =: ""
FileSelectFile, targetfile , S19, %A_ScriptDir%, Export Configuration..., Configuration Files (*.ini)
IniWrite, %targetcontent%, %targetfile%, AAKC
goto guisetup

exit:
  Send {Blind}{Escape downT}
  Send {Blind}{Escape up}
  ExitApp
Return
