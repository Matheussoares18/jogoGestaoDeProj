extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 40
var SPEED = 300 * Global.upgrades.runFaster
var JUMP_HEIGHT = -1300 * Global.upgrades.jumpHigher

var motion = Vector2()


func _process(delta):
	update_att()
	
	motion.y += GRAVITY
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
	else:
		motion.x = 0
		$AnimatedSprite.play("idle")
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
	else: 
		$AnimatedSprite.play("jump")
		
	motion = move_and_slide(motion, UP)


func _on_ps_body_entered(body):
	body.dano()
	
func update_att():
	SPEED = 300 * Global.upgrades.runFaster
	JUMP_HEIGHT = -1300 * Global.upgrades.jumpHigher
	




