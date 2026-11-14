extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$UI/Points/Points.text = str(Global.points)


func _on_player_dead() -> void:
	$UI/Upgrades.show()
	$UI/Title.show()
	$UI/Restart.show()
	get_tree().paused = true


func _on_player_point() -> void:
	Global.points += 1


func _on_ui_restart() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
