extends Node2D
@export var speed: float = 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("enemy2")
	$AnimatedSprite2D.play("walk")
	speed = randf_range(300, 200)
	await get_tree().create_timer(20.0).timeout
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		$AnimatedSprite2D.play("smashed")
		await get_tree().create_timer(0.2).timeout
		speed = 0
		await get_tree().create_timer(0.3).timeout
		queue_free()
