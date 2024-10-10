extends CanvasLayer
var lifes=3
var coins = 0
var heart1
var heart2
var heart3
# Called when the node enters the scene tree for the first time.
func _ready():
	heart1=get_node("Heart 1")
	heart2=get_node("Heart 2")
	heart3=get_node("Heart 3")
	$CoinsCollected.text = str(coins)



func _on_coin_ccollected():
	coins+=1 
	$CoinsCollected.text = str(coins)
	if coins==3:
		print()
		get_tree().change_scene_to_file("res://Scenes/mundo" + str(get_tree().current_scene.name.to_int()+1)+".tscn")

func _handle_hearts():
	if lifes==0:
		heart1.visible=false
	if lifes==1:
		heart2.visible=false
	if lifes==2:
		heart3.visible=false


func _on_player_got_hit():
	lifes=lifes-1
	_handle_hearts()
