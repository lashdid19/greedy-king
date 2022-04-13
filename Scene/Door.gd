extends Sprite
export var goTo = "res://Scene/Level 2.tscn"
func _on_Area2D_body_entered(body):
	print("teleport")
	body.resetCoin()
	get_tree().change_scene(goTo)

func _on_Player_coin_collected():
	visible = true
	$Area2D/CollisionShape2D.disabled = false

func _on_Area2D_body_exited(body):
	print("finish teleporting")
