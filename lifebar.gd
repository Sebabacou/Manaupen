extends TextureProgressBar

func _physics_process(delta):
	value = get_tree().root.get_node("world").get_node("SpaceMan").hp
