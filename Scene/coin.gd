extends Area2D

func _on_coin_body_entered(body):
	body.addCoin()
	queue_free()
