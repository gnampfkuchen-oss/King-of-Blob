extends Node2D

@export var spawn_scene: PackedScene
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func start_random_timer() -> void:
	# Neue Zufallszeit festlegen und Timer neu starten
	timer.wait_time = randf_range(1, 3.0)
	timer.start()
	
func _on_timer_timeout() -> void:
	var enemy = spawn_scene.instantiate()
	enemy.global_position = global_position
	get_parent().add_child(enemy)
	start_random_timer()
