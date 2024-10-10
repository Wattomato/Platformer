extends CharacterBody2D


const SPEED = 150.0
const incsped = 2
const MaxSpeed = 250.0
const JUMP_VELOCITY = -300.0
signal got_hit
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 850
@onready var sprite = $Sprite2D
@onready var animation = $AnimationPlayer
var life = 3

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction == 1:
		sprite.flip_h = false
		if(velocity.x<=0):
			velocity.x=SPEED
		velocity.x = min(velocity.x+incsped, MaxSpeed)
		animation.play("Walk")
	else: 
		if direction == -1:
			sprite.flip_h = true
			if(velocity.x>=0):
				velocity.x=-SPEED
			velocity.x = max(velocity.x-incsped, -MaxSpeed)
			animation.play("Walk")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			animation.play("Idle")
	
	

	move_and_slide()

func lose_life(enemypos):
	if position.x<enemypos:
		velocity.x=-800
		velocity.y=-100
	else:
		velocity.x=800
		velocity.y=-100
	print("vida actual " + str(life))
	life=life-1
	emit_signal("got_hit")
	if life<=0:
		get_tree().reload_current_scene()
	move_and_slide()

func _on_area_2d_body_entered(body):
	if body.get_name()=="Spike":
		print("NO")
		get_tree().reload_current_scene()
