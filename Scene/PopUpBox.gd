extends Control

func _on_Player_finish():
	get_tree().change_scene("res://Scene/Level 2.tscn")
	visible = true
