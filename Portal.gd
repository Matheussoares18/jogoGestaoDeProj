extends Area2D




func _ready():
	pass 


func _on_Portal_body_entered(body):
	get_tree().change_scene("Cena2.tscn")
