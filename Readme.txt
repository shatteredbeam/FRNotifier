Fuel Rats Ratsignal Notification System - By Shatt

ABOUT -
It's a simple dialog-based signal notifier for mIRC >7.0, with features designed around the needs of TFRM (The Fuel Rats Mischief).

INSTALLATION - 

Installation is easy if you are familiar with installing Remote Scripts.
Drop the root FRNotifier into your miRC\scripts directory, and then load the script with the command '/load -rs scipts\FRNotifier\FRNotifier.mrc'

You should have received this script in a .zip file containing the 'FRNotifier' Folder. If you did not, the .hsh file and the sound folder are optional.  the hsh file will be created during install, and the sound folder can be created manually and your own custom sound
files can be placed inside.

A default configuration file and alert sound will be set on initial installation.  There are no user commands for setting options.  Options are set via the Commands -> FR Notifier submenu, on the main mIRC toolbar.

* FRNotifier
|FRNotifier.mrc
|FRN.hsh
|Readme.txt (This file)
|\Sounds
| |Alert 1.mp3
  |Alert 2.mp3
  |Alert 3.mp3
  |Alert 4.mp3
  |Coins.mp3
  |Default.mp3

If you do not include the sounds folder, you will receive the message 'Sound folder not found. Audio alerts will NOT play.' 

CONFIGURATION -

The following options are available in the Options Dialog:

PC / PS4 / XBOX BUTTONS - Toggle these buttons on or off to activate an alert for the platform.  All platforms are enabled by default.

ALERTS TO ACTIVE WINDOW - Any Ratsignal will send an alert line to the active window in mIRC, Channel, PM, Status, Query, etc.

BALLOON NOTIFICATIONS - Any Ratsignal will create a system tray alert message.

DISABLE ALERTS WHILE AFK - If you enter AFK mode manually or via script, alert notifications will be automatically muted until you return.

IGNORE CR STATUS - Alert messages will ignore Oxygen/Code Red status.

TEXT-TO-SPEECH - Use TTS to speak the alert along with your chosen alert sound.  If this is disabled, only the alert sound you choose will play.

AUTO-COPY SYSTEM TO CLIPBOARD - During a Ratsignal, the system entered by the client will automatically be copied to the clipboard for ease system search while in game.  Please keep in mind, this does not use any EDDB or TFRM search.  If the client entered the system wrong, your clipboard will be wrong.

SOUNDS - Double click on a sound file to play it.  Select a file in the list and press OK to set it as the active alert sound.  These sounds are supported types located in the sounds folder.  Custom sounds of MP3, WAV, and OGG are supported; just drop your file in the folder and re-open the Options Dialog.

Pressing OK will save the current options and close the Options Dialog.  New settings are effective immediately.

RESET - Reset your options to defaults, in the event of an error or should you change your mind.

HELP - Bring up this file.  You probably already knew that.



HELP ME, SOMETHING IS BROKEN!
Unload the script, delete the FRN.hsh file and reload it.  This fixes 99% of problems.  Do this first, and if you still have issues contact Shatt on irc.fuelrats.com.

SOUNDS ARE TOO QUIET! HELP!
We don't override the system volume.  Turn up your system volume, or your speakers :)

SOUNDS WONT STOP PLAYING! HELP!
This can happen if your alert files have a long duration.  They're not stuck playing, they're overlapping.  type '/splay stop' to stop all sounds.

THE VOICES WONT STOP TALKING! HELP!
See a doctor.  Seriously, if the Text to speech engine is speaking oddly or will not stop, type '/speak -c' to clear the queue.

CAN I HAVE "FEATURE X" Sure.  This script is released under Creative Commons 4.0 Attribution, Share-Alike.  You can create your own version or modify this one all you want, as long as proper credit is given.  Contact Shatt for official feature requests.


CREDITS ETC
LICENSED UNDER https://creativecommons.org/licenses/by-nc-sa/4.0/
ALL INCLUDED AUDIO FILES ARE LICENSED UNDER CC BY AA:
* Alert 1 by Danial Simion (Soundbible.com)
* Alert 2 by Mike Koenig (Soundbible.com)
* Alert 3 by Sound Explorer (Soundbible.com)
* Alert 4 'Quite Impressed' (NotificationSounds.com)
* Coins (NotificationSounds.com)
* Default 'Gentle Alarm' (NotificationSounds.com)

Regex 'borrowed' from another unknown rat.  Have a snickers.

