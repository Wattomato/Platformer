extends CharacterBody2D


const SPEED = 30.0
const gravity = 150
var moving_left = true
@onready var sprite = $Sprite2D
@onready var animation = $AnimationPlayer

func _process(delta):
	move_character()
	turn()
func move_character():
	velocity.y = gravity
	if moving_left:
		velocity.x= -SPEED
	else:
		velocity.x= SPEED
	animation.play("Walk")
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.get_name()=="Player":
		body.lose_life(position.x)

func turn():
	if not $RayCast2D.is_colliding():
		moving_left=!moving_left
		scale.x=-scale.x
