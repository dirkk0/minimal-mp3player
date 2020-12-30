extends Control

var _temp
var audioPos := .0

var globDir
var rootDir

func _ready():
	_temp = OS.request_permissions()
	var _permissions: Array = OS.get_granted_permissions()

	rootDir = OS.get_system_dir(OS.SYSTEM_DIR_MUSIC)
	globDir = "/"
	listFiles()

func listFiles():
	var currentDir = rootDir + "/" + globDir
	# $lblDir.text = currentDir
	var directory = Directory.new()
	var error = directory.open(currentDir)
	if error == OK:
		directory.list_dir_begin()
		$lstFiles.clear()
		$lstDirs.clear()
		var file_name = directory.get_next()
		while (file_name != ""):
			if directory.current_is_dir():
				# print(file_name + "/")
				if file_name != ".": # ignore '.'
					if file_name == "..": 
						# only add '..' if we are not in the root of the music folder
						if globDir != "/": 
							$lstDirs.add_item(file_name)
					else: 
						$lstDirs.add_item(file_name)
			else:
				# print(file_name)
				$lstFiles.add_item(file_name)
			file_name = directory.get_next()
	else:
		print("Error opening directory: "+currentDir)
	# helpers.remove_recursive(localDir)
	pass

func _on_butPlay_toggled(button_pressed):
	if(button_pressed):
		print("play")
		print(audioPos)
		$musicPlayer.play(audioPos)
		$butPlay.text = "Pause"
	else:
		print("pause")
		print(audioPos)
		audioPos = $musicPlayer.get_playback_position();
		$musicPlayer.stop()
		$butPlay.text = "Play"


func _on_lstFiles_item_selected(index):
	$butPlay.disabled = false
	$butPlay.pressed = false
	audioPos = .0
	var path = rootDir + globDir + $lstFiles.get_item_text(index)
	print(path)
	var snd_file=File.new()
	snd_file.open(path, File.READ)
	var stream=AudioStreamMP3.new()
	stream.data=snd_file.get_buffer(snd_file.get_len())
	$musicPlayer.stream=stream
	snd_file.close()
	$butPlay.pressed = true

func _on_lstDirs_item_selected(index):
	var thisItem = $lstDirs.get_item_text(index)
	if globDir == "/":
		globDir = "/" + thisItem + "/"
	elif thisItem == "..":
		# 'subtract' a directory
		var tmpArray1 = Array(globDir.split("/"))
		print(len(tmpArray1))
		if len(tmpArray1) == 3:
			globDir = "/"
		else:
			var tmpArray2 = tmpArray1.slice(1,len(tmpArray1) - 3)
			globDir = "/" + PoolStringArray(tmpArray2).join("/") + "/"
	else:
		globDir += thisItem + "/"
	listFiles()
