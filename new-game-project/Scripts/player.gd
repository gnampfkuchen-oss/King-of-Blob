extends CharacterBody2D

var gravity = 8.1
var speed = 4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("right"):
		position.x += speed
	if Input.is_action_pressed("left"):
		position.x -= speed
	
	velocity.y += gravity
	position += velocity * delta
	move_and_slide()
