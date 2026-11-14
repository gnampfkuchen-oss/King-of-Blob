extends Node2D

var points = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$UI/Points/Points.text = str(points)


func _on_player_dead() -> void:
	$UI/Upgrades.show()
	$UI/Title.show()
	get_tree().paused = true


func _on_player_point() -> void:
	points += 1
