extends Control
export var backTo = "res://Scene/Level 1.tscn"
func _on_Hunger_empty():
	$Timer.start()
	get_tree().paused = true
	visible = true

func _on_Timer_timeout():
	visible = false
	get_tree().paused = false
	get_tree().change_scene(backTo)
