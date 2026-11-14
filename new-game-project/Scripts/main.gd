extends Node2D

var BOSS_SCENE = preload("res://Scenes/boss.tscn")
var spawned = false

var points = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$UI/Points/Points.text = str(points)
	if (points >= 25) and (not spawned):
		var enemy_instance = BOSS_SCENE.instantiate()
		enemy_instance.position = Vector2(1000, 600 - 20)
		add_child(enemy_instance)
		spawned = true




func _on_player_point() -> void:
	points += 1
