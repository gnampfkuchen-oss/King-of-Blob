extends Node2D

@export var spawn_scene1: PackedScene
@export var spawn_scene2: PackedScene
@export var spawn_scene3: PackedScene
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func start_random_timer() -> void:
	timer.wait_time = randf_range(1, 3.0)
	timer.start()
	
func _on_timer_timeout() -> void:
	var num = randi_range(1,3)
	var enemy = 1
	if (num == 1):
		enemy = spawn_scene1.instantiate()
		enemy.name = "enemy1"
	elif (num == 2):
		enemy = spawn_scene2.instantiate()
		enemy.name = "enemy2"
	elif (num == 3):
		enemy = spawn_scene3.instantiate()
		enemy.name = "enemy3"
	enemy.global_position = global_position
	get_parent().add_child(enemy)
	start_random_timer()
