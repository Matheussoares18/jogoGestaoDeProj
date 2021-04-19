extends KinematicBody2D

const UP = Vector2(0, -1)
var GRAVITY = 40
var SPEED = 300 
var JUMP_HEIGHT = -1100 
var grab: bool = false
var stopTimeActive = false
var canJump: bool = true

var motion = Vector2()



func _process(delta):
	
	print(canJump)
	if !Global.disabledControls:
		update_att()
		
		
		motion.y += GRAVITY
		if Input.is_action_pressed("ui_right"):
			motion.x = SPEED
			if !grab:
				$AnimatedSprite.play("run")
				$AnimatedSprite.flip_h = false
		elif Input.is_action_pressed("ui_left"):
			motion.x = -SPEED
			if !grab:
				$AnimatedSprite.play("run")
				$AnimatedSprite.flip_h = true
		else:
			motion.x = 0
			if !grab:
				$AnimatedSprite.play("idle")
			
			
		if is_on_floor() || grab:
			canJump = true
			if Input.is_action_pressed("ui_up"):
				motion.y = JUMP_HEIGHT
				
				
		elif !is_on_floor() && !grab:
			$AnimatedSprite.play("jump")
			if Input.is_action_pressed("ui_up") && canJump:
				motion.y = JUMP_HEIGHT
				canJump = false
				
		
		
	if Input.is_action_pressed("stop_time"):
		if stopTimeActive:
			GRAVITY = 40
			stopTimeActive = false
		else:
			stopTimeActive = true
			GRAVITY = 0
		
	
		
	motion = move_and_slide(motion, UP)


func _on_ps_body_entered(body):
	body.dano()
	
func update_att():
	SPEED = 300 * Global.upgrades.runFaster
	JUMP_HEIGHT = -1100 * Global.upgrades.jumpHigher
	

func _on_Area2D_body_entered(body):
	if body.get_name() == 'TileMap':
		grab = true
		$AnimatedSprite.play("grab")
		GRAVITY = 0
		motion.y = 0
	
	
func _on_Area2D_body_exited(body):
	grab = false
	GRAVITY = 40
