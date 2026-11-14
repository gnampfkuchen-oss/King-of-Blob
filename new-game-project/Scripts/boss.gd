extends Area2D
@export var speed: float = 100.0
@export var lifes: int = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("boss")
	$AnimatedSprite2D.play("walk")
	speed = randf_range(200, 100)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (position.x >= 1150):
		speed = speed * -1
	elif (position.x <= 0):
		speed = speed * -1
	position.x += speed * delta
	
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		lifes -= 1
		
		if lifes <= 0:
			$AnimatedSprite2D.play("smashed")
			await get_tree().create_timer(0.1).timeout
			speed = 0
			await get_tree().create_timer(0.3).timeout
			queue_free()
