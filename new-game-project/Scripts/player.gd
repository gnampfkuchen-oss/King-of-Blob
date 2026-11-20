extends CharacterBody2D

var gravity = 0
var speed = 140.0
var max_speed = 350.0
var acceleration = 920.0
var deceleration = 4000.0
var damage = 5
var tween: Tween

signal point(pointss: int)
signal shake(intensity, duration)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gravity = 0
	while not Input.is_anything_pressed(): await get_tree().process_frame
	$hint.hide()
	gravity = 15

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("right") and not is_on_floor():
		speed = move_toward(speed, 1 * max_speed, acceleration * (3 if speed < 0 else 1) * delta)
	elif Input.is_action_pressed("left") and not is_on_floor():
		speed = move_toward(speed, -1 * max_speed, acceleration * (3 if speed > 0 else 1) * delta)
	else:
		speed = move_toward(speed, 0.0, deceleration * delta)

	if velocity.y > 225:
		squeeze()
	if velocity.y > 0:
		$AnimatedSprite2D.play("down")
	if velocity.y < 0:
		$AnimatedSprite2D.play("up")
	if velocity.y == 0:
		$AnimatedSprite2D.play("default")
	
	velocity.x =speed
	velocity.y += gravity
	velocity.y = clamp(velocity.y, -700.0, 700.0)
	position += velocity * delta
	move_and_slide()
	clamp_to_screen()
	

func bouncefunc(force):
	velocity.y = -force

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Arena":
		$lose.play()
		position = Vector2(550, 159.055)
		velocity.y = 0
		point.emit(-5 * damage)
		gravity = 0


func _on_area_2d_area_entered(area: Area2D) -> void:
	squash()
	$smash.play()
	if area.is_in_group("enemy1"):
		bouncefunc(randi_range(520,580))
		point.emit(1 * damage)
		shake.emit(3, 0.35)
	elif area.is_in_group("enemy2"):
		bouncefunc(randi_range(615,665))
		point.emit(1 * damage)
		shake.emit(7.5, 0.25)
	elif area.is_in_group("enemy3"):
		bouncefunc(randi_range(270,320))
		point.emit(1 * damage)
		shake.emit(11, 0.7)
		$Bigparticle1.emitting = true
		$Bigparticle2.emitting = true
	elif area.is_in_group("boss"):
		point.emit(5 * damage)
		bouncefunc(600)
		

func clamp_to_screen() -> void:
	var rect := get_viewport_rect()
	position.x = clamp(position.x, 0.0, rect.size.x - 50)


func _on_lose_finished() -> void:
	$Countdown.play()
	

func _on_countdown_finished() -> void:
	gravity = 15

func squash():
	reset_tween()
	tween.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property($AnimatedSprite2D, "scale", Vector2(5.7,4), 0.15)
	await get_tree().create_timer(0.15).timeout
	reset_tween()
	tween.tween_property($AnimatedSprite2D, "scale", Vector2(5,5), 0.35)

func squeeze():
	reset_tween()
	tween.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property($AnimatedSprite2D, "scale", Vector2(5,6.5), 0.25)

func reset_tween() -> void:
	if tween:
		tween.kill()
	tween = create_tween()
