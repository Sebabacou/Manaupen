extends Node

@export var player : Node2D

var enemyScene = preload("res://ennemy/ennemy.tscn")
var spawnTimer = 0
var spawnDelay = 4  # Délai en secondes entre chaque spawn d'ennemi

func _process(delta):
	spawnTimer += delta
	if spawnTimer >= spawnDelay:
		spawnEnemy()
		spawnTimer = 0

func spawnEnemy():
	var enemyInstance = enemyScene.instantiate()  # Instanciation de l'ennemi depuis la scène
	add_child(enemyInstance)  # Ajout de l'ennemi en tant qu'enfant de ce nœud (peut être adapté selon la structure de votre jeu)
	enemyInstance.position = Vector2(randi() % get_viewport().size.x, randi() % get_viewport().size.y)
	enemyInstance.set_position(Vector2(randi() % get_viewport().size.x, randi() % get_viewport().size.y))
	enemyInstance.set_player(player)
	# Réglez la position de l'ennemi où vous voulez qu'il apparaisse
