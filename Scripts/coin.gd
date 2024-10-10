extends Node2D
signal ccollected

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_area_2d_coin_collected():
	emit_signal("ccollected")
	# Replace with function body.
