extends Node2D
@export var speed: float = 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speed = randf_range(-100, -200)
	await get_tree().create_timer(20.0).timeout
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += speed * delta


func _on_body_entered(_body: Node2D) -> void:
	queue_free()   
