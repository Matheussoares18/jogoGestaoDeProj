extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("camera")
	


func _on_AnimationPlayer_animation_finished(anim_name):
	Global.set_controls_state(false)
