extends Node2D
@export var speed: float = 100.0
@export var child: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
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
		var szene = load("res://Scenes/enemy1_R.tscn")
		$AnimatedSprite2D.play("smashed")
		await get_tree().create_timer(0.1).timeout
		speed = 0
		await get_tree().create_timer(0.3).timeout
		
		var instanz1 = szene.instantiate()
		instanz1.global_position = global_position
		get_parent().call_deferred("add_child", instanz1)

		var instanz2 = szene.instantiate()
		instanz2.global_position = global_position
		get_parent().call_deferred("add_child", instanz2)
		queue_free()
