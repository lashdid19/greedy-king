extends Control

var scene = "Start"

func _physics_process(delta):
	if Input.is_action_just_pressed("jump") :
		$Start.visible = true
		$Credits.visible = false
		scene = "Start"
	elif Input.is_action_just_pressed("down") :
		$Start.visible = false
		$Credits.visible = true
		scene = "Credits"
	elif Input.is_action_just_pressed("ui_accept") and scene == "Start":
		$Transition.transition()
	elif Input.is_action_just_pressed("ui_accept") and scene == "Credits":
		get_tree().change_scene("res://Scene/Credits.tscn")

func _on_Transition_transition():
	get_tree().change_scene("res://Scene/Level 1.tscn")
