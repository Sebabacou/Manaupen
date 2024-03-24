extends Timer

const ennemy_path = preload("res://ennemy/ennemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timeout():
	#var enemy = ennemy_path.instanciate()
	#enemy.position = randi() % (100 - 0 + 1) + 0
	#get_parent().add_child(enemy)
	pass
