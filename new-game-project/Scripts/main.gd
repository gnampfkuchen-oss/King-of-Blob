extends Node2D

var points

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_player_dead() -> void:
	print("tot")

func pointsup():
	$UI/Points/Pointlabel.text = points
