extends Node2D

var points = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$UI/Points/Points.text = str(points)


func _on_player_dead() -> void:
	print("tot")


func _on_player_point() -> void:
	points += 1
