extends Control

var start = false;
signal half;
signal empty;
func _input(event):
	if $Timer.time_left == 0 and event is InputEventKey :
		if event.pressed:
			$Timer.start()

func _physics_process(delta):
	print($Bar.margin_right)
	if $Timer.time_left != 0 :
		$Bar.margin_right = $Timer.time_left * 4
	if $Bar.margin_right <= 120 :
		emit_signal("half")
	if $Bar.margin_right <= 10 :
		print("dead")
		emit_signal("empty")
