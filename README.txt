Actress Again Keyboard Configurator
Release 1, Hotfix 1

Powered by AutoHotKey V1.1.33.10
Script and program by Hammercrxft(GitHub)

::::::::::::::::::::::::::::::::::::::::::::::::
	
	HOW TO USE
	
::::::::::::::::::::::::::::::::::::::::::::::::

1.) Launch 'mbaakeyboardconfig.exe' or 'mbaakeyboardconfig.ahk'

2.) Set each control to any name of keyboard key you want (See key names below.)

3.) Check your other settings

	3a.)Exit and Quit Game (Key)
		- The key to press to close both the
		game and the keyboard configurator.
		
	3b.)Hold to Exit
		- When checked, the key used to quit the
		game is required to be held down for
		3 seconds.
		
	3c.)F10 Reload
		- When checked, pressing F10 will reload
		the configurator and show its menu.
		
	3d.)Remember Current Settings
		- When checked, the configurator will
		remember your current setup for use in
		the next launch.
		
		- Disabling this and restarting the 
		program will effectively reset your
		configuration into its defaults.
		
4.) Apply and Close
	
	- Note: This will only close the config
	menu.
	
5.) Play the game!
	
	- If the game is not running, open it and play.
	
6.) Closing the configurator

	- After playing, close the configurator by
	going to your taskbar trays,
	right-clicking AAKC's tray icon, then
	clicking 'Exit'.

::::::::::::::::::::::::::::::::::::::::::::::::

	How it works

::::::::::::::::::::::::::::::::::::::::::::::::

Actress Again Keyboard Configurator is 
an AutoHotKey script / executable that provides a method
to rebind their keyboard controls for MBAACC.

It prevents the user from directly interacting with
the keyboard control keys used by the game,
while the game is the active window.

Instead, the script itself will input to the game directly
if the user enters a key which is configured for a control.

Being a AHK script/program, you no longer require
to modify the game's memory, however this will result
in an increase of input latency.



::::::::::::::::::::::::::::::::::::::::::::::::

	Changelog

::::::::::::::::::::::::::::::::::::::::::::::::

Release 1, Hotfix 1:
  - Fixed a typo that prevented Player 1's start
    button to be configurable.
  - Increased maximum input per interval.

Release 1
  - First release.

::::::::::::::::::::::::::::::::::::::::::::::::
	
	List of Key Names
	
::::::::::::::::::::::::::::::::::::::::::::::::

Please use lowercase letters when assigning keys.
Uppercase letters and shifted symbols are
unusable as it implies the usage of SHIFT.

NumPad keys require NumLock to be activated,
else the cursor control keys will be used
(cursor control = arrows, insert, home, etc.)

Not all key names are listed, including repetitive
keyboard key names, multimedia key names,
and mouse button names.

Do ignore text in the parentheses.

For a full list, see
https://www.autohotkey.com/docs/KeyList.htm


esc
escape
f1
f2
f3
f4
f5
f6
f7
f8
f9
f10
f11
f12
`
1
2
3
4
5
6
7
8
9
0
-
=
backspace
q
w
e
r
t
y
u
i
o
p
[
]
\
a
s
d
f
g
h
j
k
l
;
'
enter
shift (both lshift and rshift)
lshift (left shift)
rshift (right shift)
z
x
c
v
b
n
m
,
.
/
ctrl (both lctrl and rctrl)
lctrl (left ctrl)
rctrl (right ctrl)
alt (also activated when lalt, ralt and altgr is pressed)
lalt (left alt)
ralt (right alt)
space
spacebar
appskey (the key that opens the right click menu)
altgr (used in european keyboards)
printscreen (appears as PrtScr in your keyboard.)
pause (Pause/Break)
insert
home
pageup
delete
end
pagedown
up (arrow)
left (arrow)
down (arrow)
right (arrow)
numpaddiv (division /)
numpadmult (multiplication *)
numpadadd (addition +)
numpadsub (subtraction -)
numpadenter
numpaddot (.)
numpad1
numpad2
numpad3
numpad4
numpad5
numpad6
numpad7
numpad8
numpad9
numpad0