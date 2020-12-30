# minimal-mp3player

Since Godot 3.2.4 beta, the AudioStream element supports mp3 streams. To showcase that (and to get more experience with Godot), this implementation was created. The code aims to be minimal, design is non-existent. Mac, Windows, Linux and Android export binaries will be included.

## Features
- implements a mini mp3 player
- requests permission to access media files on Android
- loads files from external sources (i.e. not user:// or res://)
- plays files from the music directory
- no design at all!

## Notes on how to implement this from scratch

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
- create button butPlay, duplicate it twice
- rename to butPause and butStop
- - set butPlay to Toggle Mode on
- create ItemList lstFiles and lstDirs
- save to main.tscn
- run once, select main.tscn
- add script main.gd