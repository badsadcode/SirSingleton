extends Node

var playerNode = null
var current_scene = null

func goto_scene(path):
	call_deferred("_deferred_goto_scene",path)

func _deferred_goto_scene(path):
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instance()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)
	findPlayerNode()

func findPlayerNode():
	Global.playerNode = get_tree().get_root().find_node("Player",true,false) 
	if Global.playerNode == null:
		print ("No player node in scene")
	else:
		print ("Player node name is: " + Global.playerNode.name)
	
func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	findPlayerNode()
