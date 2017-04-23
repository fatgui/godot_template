
extends Node

const STATE_INIT = 0
const STATE_FADEIN = 1
const STATE_SHOWING = 2
const STATE_FADEOUT = 3
const STATE_FINISHED = 4
var state = STATE_INIT

var alpha = 0;
export var fadeSpeed = 0.5;
export var initTime = 1 #in seconds
export var showingTime = 4
var timeWaited = 0

var logo = null
var logo2 = null
var label = null

func _ready():
	logo = get_node("myLogo")
	logo.set_modulate(Color(255,255,255,alpha))
	logo2 = get_node("myLogo1")
	logo2.set_modulate(Color(255,255,255,alpha))
	label = get_node("Label")
	label.set_opacity(alpha)
	set_process(true)

func getSplashScreenState():
	return state

func _process(delta):
	if state == STATE_INIT:
		timeWaited += delta
		if timeWaited >= initTime:
			timeWaited = 0
			state = STATE_FADEIN
			
	elif state == STATE_FADEIN:
		alpha += fadeSpeed * delta
		logo.set_modulate(Color(1,1,1,alpha))
		logo2.set_modulate(Color(1,1,1,alpha))
		label.set_opacity(alpha)
		
		if alpha >= 1:
			alpha = 1
			state = STATE_SHOWING		
	

func _on_TextureButton_pressed():
	get_node("/root/sceneManager").goto_scene("res://MainMenuScene/main_menu.tscn")
