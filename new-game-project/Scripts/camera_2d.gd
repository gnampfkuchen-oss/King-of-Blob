extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func shake(intensity: float = 15.0, duration: float = 0.3) -> void:
	var tween = create_tween()
	for i in 2:
		var random_offset = Vector2(randf_range(-intensity, intensity), randf_range(-intensity, intensity))
		tween.tween_property(self, "offset", random_offset, duration / 15.0)
	tween.tween_property(self, "offset", Vector2.ZERO, duration / 15.0)

func _on_player_point(_pointss: int) -> void:
	shake()
	pass
