extends Control



func _process(delta):
	
	if get_tree().paused:
		$CanvasLayer/CenterContainer.visible = true
		$CanvasLayer/CenterContainer/VBoxContainer/Label.text = "Coins diponiveis: " + str(Global.coins)
		
	else:
		$CanvasLayer/CenterContainer.visible = false
		
	if Input.is_action_just_pressed("got_to_shop"):
		
		get_tree().paused = !get_tree().paused
		
		
	


func _on_BuyJumpBtn_pressed():
	Global.buy_upgrade("jumpHigher")
	$CanvasLayer/CenterContainer/VBoxContainer/Label.text = "Coins diponiveis: " + str(Global.coins)
	


func _on_BuyRunBtn_pressed():
	Global.buy_upgrade("runFaster")
	$CanvasLayer/CenterContainer/VBoxContainer/Label.text = "Coins diponiveis: " + str(Global.coins)
