extends CanvasLayer

signal transition;

func transition() :
	$AnimationPlayer.play("to_black")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "to_black" :
		emit_signal("transition")
		$AnimationPlayer.play("to_normal")
		
