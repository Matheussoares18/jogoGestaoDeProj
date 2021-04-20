extends Node2D

func _ready():
	$AnimationPlayer.play("coinAnimation")



func _on_Coins_body_entered(body):
	if body.get_name() == 'player':
		Global.add_coins(1)
		queue_free()
		
