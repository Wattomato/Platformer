extends Node2D

@onready var animation = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("Spin")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.get_name()=="Player":
		body.lose_life(position.x)
