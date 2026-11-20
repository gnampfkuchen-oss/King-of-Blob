extends Area2D
@export var speed: float = 100.0
@export var child: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("enemy3")
	$AnimatedSprite2D.flip_h = true
	$AnimatedSprite2D.play("walk")
	speed = randf_range(-100, -200)
	await get_tree().create_timer(20.0).timeout
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		var szene1 = load("res://Scenes/enemy3S_R.tscn")
		var szene2 = load("res://Scenes/enemy3S_L.tscn")
		$AnimatedSprite2D.play("smashed")
		await get_tree().create_timer(0.1).timeout
		speed = 0
		await get_tree().create_timer(0.3).timeout
		
		var instanz1 = szene1.instantiate()
		instanz1.name = "enemy1"
		instanz1.global_position = Vector2(global_position.x, global_position.y + 20)
		get_parent().call_deferred("add_child", instanz1)

		var instanz2 = szene2.instantiate()
		instanz2.name = "enemy1"
		instanz2.global_position = Vector2(global_position.x, global_position.y + 20)
		get_parent().call_deferred("add_child", instanz2)
		queue_free()
