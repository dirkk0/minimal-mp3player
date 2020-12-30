# minimal-mp3player

Since Godot 3.2.4 beta, the AudioStream element supports mp3 streams. To showcase that (and to get more experience with Godot), this implementation was created. The code aims to be minimal, design is non-existent. Mac, Windows, Linux and Android (only Android<10 for now) export binaries will be included.

## Features
- implements a mini mp3 player
- requests permission to access media files on Android
- loads files from external sources (i.e. not user:// or res://) (*works only on Android < 10 [due to this problem](https://github.com/godotengine/godot/issues/39414) at the moment)
- plays files from the music directory
- no design at all!

Binaries are included; if you check them out, don't forget to put something in the music directory.

## Notes on how to implement this from scratch

- install Godot 3.2.4 beta
- create directory
- touch project.godot
- godot -e
- project settings Config give Name mp3player
- project settings display/window change width/height to 300/512
- project settings window orientation to portrait
- project settings stretch mode/aspect: 2d/keep
- (set GLES2)
- (project settings vram compression import etc)
- give control Rect a Size of 300/512
- create button butPlay
- set butPlay to Toggle Mode on
- create ItemList lstFiles and lstDirs
- save to main.tscn
- run once, select main.tscn
- add script main.gd
- create signal for butPlay with toggle_button
- create signals for lst* with item_selected


If you want to export to Android, set the permission 'Read External Storage', otherwise the APK won't see any files.