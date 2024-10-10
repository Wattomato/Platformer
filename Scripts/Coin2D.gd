extends Area2D

signal CoinCollected

func _on_body_entered(body):
	if body.get_name()=="Player":
		emit_signal("CoinCollected")
		queue_free() 
