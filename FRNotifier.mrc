;======================================
;Fuel Rats SIGNAL Notification Script
;An easy way to start getting rat signals for mIRC
;Freely available to all Fuel Rats, (Released under CC BY-NC-SA 4.0)
;======================================

on *:LOAD: {
  set %frn.dir $scriptdir
  set %frn.prefix 4[FR Notifier]
  set %frn.muteall 0
  set %frn.muteaudio 0

  if ($exists(%fr.dir $+ sounds\)) {
    set %frn.sdir $scriptdir $+ sounds\ 
  }
  else {
    echo -s %frn.prefix Sound folder not found.  Audio alerts will NOT play.
    echo -s %frn.prefix Place .mp3/.wav/.ogg files into the sound folder: %frn.sdir
  }

}

on *:START: {

  if ($exists(%frn.dir $+ FRN.hsh)) {
    hmake FRN.Settings 25
    hload FRN.Settings %frn.dir $+ FRN.hsh
    echo -s %frn.prefix Existing configuration file found and loaded.
  }
  else {
    htable.init
    echo -s %frn.prefix No existing configuration file found. A new one was generated with default options.
  }

  echo -s %frn.prefix Loaded. Config options under 'Commands' menubar.

}

on *:EXIT: {
  hsave -o FRN.Settings %frn.dir $+ FRN.hsh
}  

on *:UNLOAD: {
  unset %frn.*
  echo -s 4* FRNotifier Unloaded.  Please reload with "/load -rs FRNotifier\FRNotifier.mrc" if reloading to fix an error.

}
on $*:TEXT:/.*(RATSIGNAL.*CMDR (.*) \- System\72 ([\w -]+) \(.*Platform\72 (\w+).*O2\72 (NOT OK|OK).*Case #(\d+).*)/S:*: {

  if ($away && $hget(FRN.Settings,AFKDisable) halt

  if (%frn.muteall) halt


  set %frn.rs.commander $regml(2)
  set %frn.rs.system $regml(3)
  set %frn.rs.platform $regml(4)
  set %frn.rs.o2 $regml(5)
  set %frn.rs.case $regml(6)
  set %frn.rs.string Case $chr(35) $+ %frn.rs.case $+ : Cmdr. %frn.rs.commander in %frn.rs.system on %frn.rs.platform 

  if (%frn.rs.case == PC && !$hget(FRN.Settings,PC)) { halt }
  if (%frn.rs.case == PS4 && !$hget(FRN.Settings,PS4)) { halt }
  if (%frn.rs.case == XBox && !$hget(FRN.Settings,Xbox)) { halt }

  if ($hget(FRN.Settings, ClipboardCopy)) { clipboard %frn.rs.system }
  if ($hget(FRN.Settings, ActiveAlerts)) { echo -a %frn.prefix %frn.rs.string  }
  if ($hget(FRN.Settings, Balloons)) { %frn.tip $tip(ratsignal,Ratsignal,%frn.rs.string,20) }
  if ($hget(FRN.Settings, TTS)) { .speak Incoming $iif(!$hget(FRN.Settings,IgnoreCR) && %frn.rs.o2 == NOT OK,critical,$null) %frn.rs.platform case. } 

  if (!%frn.muteaudio) { .splay $hget(FRN.Settings,AlertSound) }

}

alias frn.d.open { dialog -m FRN FRN }

alias htable.init {
  hmake FRN.Settings 25
  hadd FRN.Settings PC 1
  hadd FRN.Settings PS4 1
  hadd FRN.Settings XBOX 1
  hadd FRN.Settings TTS 1
  hadd FRN.Settings IgnoreCR 0
  hadd FRN.Settings Balloons 1
  hadd FRN.Settings ClipboardCopy 1
  hadd FRN.Settings ActiveAlerts 1
  hadd FRN.Settings AFKDisable 1
  hadd FRN.Settings AlertSound %frn.sdir $+ default.mp3
  hadd FRN.Settings AlertStatus 1
  hadd FRN.Settings Version 1.1
  hsave -o FRN.Settings %frn.dir $+ FRN.hsh

}

alias frn.muteaudio {
  if (%frn.muteaudio) {
    set %frn.muteaudio 0
    echo -a %frn.prefix Audio Alerts are now on.
  }
  else {
    set %frn.muteaudio 1
    echo -a %frn.prefix Audio Alerts are now off.
  }
  frn.titlebar
}

alias frn.muteall {
  if (%frn.muteall) {
    set %frn.muteall 0
    echo -a %frn.prefix Alerts are now on.
  }
  else {
    set %frn.muteall 1
    echo -a %frn.prefix Alerts are now off.
  }
  frn.titlebar
}

alias frn.titlebar {
  titlebar
  if (%frn.muteaudio) { titlebar [FRN AUDIO MUTED] }
  if (%frn.muteall) { titlebar [FRN ALERTS MUTED] }
}

on *:DIALOG:FRN:init:*: {

  if ($hget(FRN.Settings,TTS)) { did -c FRN 1 }
  if ($hget(FRN.Settings,PC)) { did -c FRN 2 }
  if ($hget(FRN.Settings,PS4)) { did -c FRN 3 }
  if ($hget(FRN.Settings,XBOX)) { did -c FRN 4 }
  if ($hget(FRN.Settings,IgnoreCR)) { did -c FRN 6 }
  if ($hget(FRN.Settings,Balloons)) { did -c FRN 7 }
  if ($hget(FRN.Settings,ActiveAlerts)) { did -c FRN 8 }
  if ($hget(FRN.Settings,AFKDisable)) { did -c FRN 11 }
  if ($hget(FRN.Settings,ClipboardCopy)) { did -c FRN 15 }

  var %frn.numsounds $findfile(%frn.sdir,*.mp3;*.wav;*.ogg,0,0,did -a FRN 12 $nopath($1-))

}

on *:DIALOG:FRN:sclick:14: {

  hadd FRN.Settings TTS $did(1).state
  hadd FRN.Settings PC $did(2).state
  hadd FRN.Settings PS4 $did(3).state
  hadd FRN.Settings XBOX $did(4).state
  hadd FRN.Settings IgnoreCR $did(6).state
  hadd FRN.Settings Balloons $did(7).state
  hadd FRN.Settings ActiveAlerts $did(8).state
  hadd FRN.Settings AFKDisable $did(11).state
  hadd FRN.Settings ClipboardCopy $did(15).state

  if ( $did(12).seltext != $null ) { hadd FRN.Settings AlertSound %frn.sdir $+ $did(12).seltext }

  dialog -c FRN
}

on *:DIALOG:FRN:sclick:9: {
  if ($?!("Reset to default alert settings? $crlf This cannot be undone.") == $true) {
    dialog -c FRN
    hfree FRN.Settings
    htable.init
    frn.d.open
  }
}

on *:DIALOG:FRN:sclick:10: { /run notepad.exe %frn.dir $+ Readme.txt }

on *:DIALOG:FRN:dclick:12: {
  .splay %frn.sdir $+ $did(12).seltext
}

dialog FRN {
  title "Ratsignal Notifier"
  size -1 -1 102 168
  option dbu
  check "PC", 2, 6 12 26 10, push
  check "Xbox", 3, 72 12 26 10, push
  check "PS4", 4, 39 12 26 10, push
  check "Text-To-Speech", 1, 6 66 59 10
  check "Ignore CR Status", 6, 6 57 56 10
  check "Balloon Notifications", 7, 6 39 74 10
  check "Alerts to Active Window", 8, 6 30 74 10
  button "Reset", 9, 72 155 28 12
  button "Help", 10, 2 155 28 12
  text "Show Alerts for:", 5, 6 3 55 8
  check "Disable Alerts while AFK", 11, 6 48 71 10
  list 12, 3 111 95 41, sort size
  text "Sounds (Double click to play)", 13, 6 102 91 8, center
  button "OK", 14, 32 155 37 12, result
  check "Auto-copy system to clipboard", 15, 6 75 89 10
}

menu menubar {
  FR Notifier:
  .$iif(%frn.muteaudio,Unmute,Mute) Alert Audio:/frn.muteaudio
  .$iif(%frn.muteall,Unmute,Mute) All Alerts:/frn.muteall
  .-
  .Options:/frn.d.open
  .Help:/run notepad.exe %frn.dir $+ Readme.txt
  .-
  .Uninstall:/unload -rs $script
}
