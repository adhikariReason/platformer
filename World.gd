extends Node2D
var count = 0


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(count)
	count = 0
	$won.text = ""
	$Player/Camera2D/Label.text  = "Snowman Collected: " + str(0)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_KillPlane_body_entered(body):
	print(body)
	$Player.position.x = 30
	$Player.position.y = 200



func _on_collectible_snowCollected():
	count+=1
	var text1 = "Snowman Collected: " + str(count)
	$Player/Camera2D/Label.text = text1
	


func _on_Goal_body_entered(body):
	$won.text = "You Won"
