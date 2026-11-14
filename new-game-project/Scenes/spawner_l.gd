extends Node2D

@export var spawn_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	print("koks")
	var enemy = spawn_scene.instantiate()
	enemy.global_position = global_position
	get_parent().add_child(enemy)
