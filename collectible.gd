extends Area2D
signal snowCollected

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.show()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_collectible_body_entered(body):
	$AnimatedSprite.hide()
	emit_signal("snowCollected")
