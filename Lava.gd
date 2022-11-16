extends Sprite


var player = null

func _ready():
	player = Global.playerNode
	if player == null:
		print ("player is null") # WHY??
	else:
		print ("It should work." + player.name)



