extends Camera2D

func shake(intensity: float = 10.0, duration: float = 0.5) -> void:
	var tween = create_tween()
	for i in 2:
		var random_offset = Vector2(randf_range(-intensity, intensity), randf_range(-intensity, intensity))
		tween.tween_property(self, "offset", random_offset, duration / 15.0)
	tween.tween_property(self, "offset", Vector2.ZERO, duration / 15.0)


func _on_player_shake(intensity: Variant, duration: Variant) -> void:
	shake(intensity, duration)
