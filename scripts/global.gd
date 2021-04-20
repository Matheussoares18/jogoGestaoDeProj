extends Node

var coins: int = 0

var upgrades = {
	'runFaster':1,
	'jumpHigher':1,
	'stopTime': false
}
var disabledControls = true





func add_coins(amount: int) -> void:
	coins += amount

	
func reset_coins() -> void:
	coins = 0
	

func decrease_coins(amount: int) -> void:
	coins -= amount
	
	
	
func buy_upgrade(name:String ) -> void:
	if coins >= 5:
		if name == 'runFaster':
			upgrades.runFaster = upgrades.runFaster + 0.5
			decrease_coins(5)
			
		if name == 'jumpHigher':
			upgrades.jumpHigher = upgrades.jumpHigher + 0.5
			decrease_coins(5)
func set_controls_state(state) -> void:
	disabledControls = state
	
